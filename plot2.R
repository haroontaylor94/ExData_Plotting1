##Reading in the data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

##Subsetting the data
data_req <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]
attach(data_req)
GlobActPow <- as.numeric(Global_active_power)
date_time <- strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Making the graph
quartz()
plot(date_time, GlobActPow, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Making png file of the graph
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()