data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

subset <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
subset$datetime <- strptime(paste(subset$Date, subset$Time), format = "%Y-%m-%d %T")

png(file = "plot1.png", width = 480, height = 480)
hist(subset$Global_active_power, col = "red", xlab = "Global active power (kilowatts)", main = "Global Active Power")
dev.off()
