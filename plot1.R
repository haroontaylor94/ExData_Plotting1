##Reading in the data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

##Subsetting the data
data_req <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]
attach(data_req)
GlobActPow <- as.numeric(Global_active_power)

##Making the graph
quartz()
hist(GlobActPow, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

##Making png file of the graph
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
