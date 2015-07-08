# household_power_consumption data set should be in the working directory 
# with this script
# data loading routines
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = c("?"), stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
data$Time <- as.Date(data$Time, format = "%H:%M:%S")

# --------------------------------------------
par(mfrow = c(2, 2))
# topleft
plot(data$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l",
     xaxt = "n")

# topright
plot(data$Voltage,
     ylab = "Voltage",
     xlab = "",
     type = "l",
     xaxt = "n")

# bottomleft
plot(data$Sub_metering_1,
     col = "black",
     type = "l",
     ylab = "Energy sub metering",
     xlab = "",
     xaxt = "n")
points(data$Sub_metering_2, col = "red", type = "l")
points(data$Sub_metering_3, col = "blue", type = "l")
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = "solid",
       cex = 0.5,
       y.intersp = 0.5,
       bty = "n")
axis(side = 1,
     at = seq(0, nrow(data), nrow(data) / 2),
     labels = c("Tue", "Fri", "Sat"))
# bottomright
plot(data$Global_reactive_power,
     ylab = "Global reactive power",
     xlab = "",
     type = "l",
     xaxt = "n")
axis(side = 1,
     at = seq(0, nrow(data), nrow(data) / 2),
     labels = c("Tue", "Fri", "Sat"))

# export to png
dev.copy(png, 'plot4.png', width = 504, height = 504)
dev.off()
