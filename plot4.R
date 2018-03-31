# Exploratory Data Analysis
# Course Project 1
# plot4.R
# Cherie Bardsley
# 3/29/2018

# Read the Electric Power Consumption data from the downloaded household_power_consumption.txt file
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert the Date variable to Date class
hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")

# Subset the data to filter from 2007-02-01 and 2007-02-02
hpc_sub <- subset(hpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create a new variable that combines the Date and Time variables and convert this new variable to Date/Time class
hpc_sub$datetime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%Y-%m-%d %H:%M:%S")

# Save plot4 to a PNG file with a width and height of 480 pixels
png("plot4.png", width = 480, height = 480)

# Set the parameter to create four plots, two on each row
par(mfrow = c(2, 2))

# Create the first graph in the first row showing Global Active Power by day of the week
plot(hpc_sub$datetime, hpc_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Create the second graph in the first row showing Voltage by day of the week
plot(hpc_sub$datetime, hpc_sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Create the first graph in the second row showing Energy sub metering by day of the week
plot(hpc_sub$datetime, hpc_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpc_sub$datetime, hpc_sub$Sub_metering_2, type = "l", col = "red")
lines(hpc_sub$datetime, hpc_sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty = "n")

# Create the second graph in the second row showing Global reactive power by day of the week
plot(hpc_sub$datetime, hpc_sub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Close the PNG device
dev.off()
