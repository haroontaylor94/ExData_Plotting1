##Reading in the data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

##Subsetting the data
data_req <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]
attach(data_req)
date_time <- strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S")
SubMet1 <- as.numeric(Sub_metering_1)
SubMet2 <- as.numeric(Sub_metering_2)
SubMet3 <- as.numeric(Sub_metering_3)

## Making the graph
quartz()
plot(date_time, SubMet1, type="l", xlab="", ylab="Energy sub metering")

##Adding data to the graph
lines(date_time, SubMet2, type="l", col="red")
lines(date_time, SubMet3, type="l", col="blue")

##Adding legend to the graph
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

##Making png file of the graph
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()