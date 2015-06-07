##Reading in the data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

##Subsetting the data
data_req <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]
attach(data_req)
GlobActPow <- as.numeric(Global_active_power)
GlobReactPow <- as.numeric(Global_reactive_power)
Volt <- as.numeric(Voltage)
date_time <- strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S")
SubMet1 <- as.numeric(Sub_metering_1)
SubMet2 <- as.numeric(Sub_metering_2)
SubMet3 <- as.numeric(Sub_metering_3)

## Set up graph window
quartz()
par(mfrow=c(2,2))

## Making graph 1
plot(date_time, GlobActPow, type="l", xlab="", ylab="Global Active Power")

## Making graph 2
plot(date_time, Volt, type="l", xlab="datetime", ylab="Voltage")

## Making graph 3
plot(date_time, SubMet1, type="l", xlab="", ylab="Energy sub metering")
lines(date_time, SubMet2, type="l", col="red")
lines(date_time, SubMet3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

## Making graph 4
plot(date_time, GlobReactPow, type="l", xlab="datetime", ylab="Global_reactive_power", yaxp=c(0.0, 0.5, 5))

##Making png file of the graph
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()