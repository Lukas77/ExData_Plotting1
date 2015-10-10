data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

subset <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
subset$datetime <- strptime(paste(subset$Date, subset$Time), format = "%Y-%m-%d %T")

png(file = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

plot(subset$datetime, subset$Global_active_power, type="n", xlab = "", ylab = "Global active power", main = "")
lines(subset$datetime, subset$Global_active_power)

plot(subset$datetime, subset$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering", main = "")
lines(subset$datetime, subset$Sub_metering_1, col = "black")
lines(subset$datetime, subset$Sub_metering_2, col = "red")
lines(subset$datetime, subset$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

with(subset, plot(datetime, Voltage, type="n", main = ""))
with(subset, lines(datetime, Voltage))

with(subset, plot(datetime, Global_reactive_power, type="n", main = ""))
with(subset, lines(datetime, Global_reactive_power))

dev.off()