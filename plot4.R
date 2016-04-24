## Download dataset from : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
## Read into R from destination folder

data <- read.csv("/Users/carlamusi/Desktop/Data Science/4. Exploratory Data Analysis/Week 1/04 Course Project 1 /household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", stringsAsFactors = FALSE)

## Convert Date variable

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data for corresponding dates for analysis

subsetdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Convert dates

datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$datetime <- as.POSIXct(datetime)

## Create Plot 4

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(subsetdata$Global_active_power~subsetdata$datetime, xlab = "", ylab = "Global Active Power", type = "l")
plot(subsetdata$Voltage~subsetdata$datetime, xlab = "datetime", ylab = "Voltage", type = "l")
plot(subsetdata$Sub_metering_1~subsetdata$datetime, xlab = "", ylab = "Energy sub metering", type = "l")
lines(subsetdata$Sub_metering_2~subsetdata$datetime, type = "l", col = "Red")
lines(subsetdata$Sub_metering_3~subsetdata$datetime, type = "l", col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, bty = "n",  col = c ("black", "red", "blue"))
plot(subsetdata$Global_reactive_power~subsetdata$datetime, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()




