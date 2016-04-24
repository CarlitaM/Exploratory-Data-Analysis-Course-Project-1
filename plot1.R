## Download dataset from : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 

data <- read.csv("/Users/carlamusi/Desktop/Data Science/4. Exploratory Data Analysis/Week 1/04 Course Project 1 /household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", stringsAsFactors = FALSE)

## Convert Date variable

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data for corresponding dates for analysis

subsetdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Create Plot 1 

png("plot1.png", width = 480, height = 480)
hist(subsetdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
dev.off()
