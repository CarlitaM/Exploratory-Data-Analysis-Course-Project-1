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

## Create Plot 2

png("plot2.png", width = 480, height = 480)
plot(subsetdata$Global_active_power~subsetdata$datetime, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()
