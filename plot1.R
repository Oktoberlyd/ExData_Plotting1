##############################################
#                                            #
# Exploratory Data Analysis - Week 1 project #
#                                            #
#   Plot 1                                   #
#                                            #
#                                            #
##############################################

# libaries are loaded
library(tidyverse)
library(lubridate)
library(data.table)

#working directory is set
setwd("C:/Users/ocari/OneDrive/Documents/Coursera")


#data i collected and unzipped
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "electric_power.zip")
unzip("electric_power.zip") #data is unzipped 

#check files
list.files()

#load and check out files
household_power_consumption <- fread("household_power_consumption.txt")
str(household_power_consumption) #formats needs to be changed

#changing date format
household_power_consumption$Date <- dmy(household_power_consumption$Date)

#only data from dates  2007-02-01 and 2007-02-02
household_two_dates <- dplyr::filter(household_power_consumption, Date == "2007-02-01" | Date == "2007-02-02")


#creating date_time variable
date_time <- paste(household_two_dates$Date, household_two_dates$Time)
household_two_dates$date_time <- as.POSIXct(date_time)

#changing rest of formats
household_two_dates$Global_active_power <- as.numeric(household_two_dates$Global_active_power)
household_two_dates$Global_reactive_power <- as.numeric(household_two_dates$Global_reactive_power)
household_two_dates$Voltage <- as.numeric(household_two_dates$Voltage)
household_two_dates$Global_intensity <- as.numeric(household_two_dates$Global_intensity)
household_two_dates$Sub_metering_1 <- as.numeric(household_two_dates$Sub_metering_1)
household_two_dates$Sub_metering_2 <- as.numeric(household_two_dates$Sub_metering_2)
household_two_dates$Sub_metering_3 <- as.numeric(household_two_dates$Sub_metering_3)

#recheck
str(household_two_dates) #formats look allright

#plot one
hist(household_two_dates$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# copy plot to a PNG file
dev.copy (png, file = "plot1.png" )
dev.off()
