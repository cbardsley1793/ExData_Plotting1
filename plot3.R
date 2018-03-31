# Exploratory Data Analysis
# Course Project 1
# plot3.R
# Cherie Bardsley
# 3/29/2018

# Set working directory
setwd ("/Users/cbardsley/Documents/Exploratory Data Analysis/")

# Read the Electric Power Consumption data from the downloaded household_power_consumption.txt file
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert the Date variable to Date class
hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")

# Subset the data to filter from 2007-02-01 and 2007-02-02
hpc_sub <- subset(hpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create a new variable that combines the Date and Time variables and convert this new variable to Date/Time class
hpc_sub$datetime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%Y-%m-%d %H:%M:%S")

# Save plot3 to a PNG file with a width and height of 480 pixels
png("plot3.png", width = 480, height = 480)

# Create a line graph of Sub metering 1 data by day of the week
plot(hpc_sub$datetime, hpc_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

# Add a red line to the graph for Sub metering 2 data by day of the week
lines(hpc_sub$datetime, hpc_sub$Sub_metering_2, type = "l", col = "red")

# Add a blue line to the graph for sub metering 3 data by day of the week
lines(hpc_sub$datetime, hpc_sub$Sub_metering_3, type = "l", col = "blue")

# Add a legend to the graph
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd = c(1,1))

# Close the PNG device
dev.off()