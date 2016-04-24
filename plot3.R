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

## Create Plot 3

png("plot3.png", width = 480, height = 480)
plot(subsetdata$Sub_metering_1~subsetdata$datetime, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
lines(subsetdata$Sub_metering_2~subsetdata$datetime, col = 'Red', type = "l")
lines(subsetdata$Sub_metering_3~subsetdata$datetime, col = 'Blue', type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
