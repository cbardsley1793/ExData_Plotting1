# Exploratory Data Analysis
# Course Project 1
# plot1.R
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

# Save plot1 to a PNG file with a width and height of 480 pixels
png("plot1.png", width = 480, height = 480)

# Create a histogram for Global Active Power
hist(hpc_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close the PNG device
dev.off()
