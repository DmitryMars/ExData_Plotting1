# household_power_consumption data set should be in the working directory 
# with this script
# data loading routines
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = c("?"), stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
data$Time <- as.Date(data$Time, format = "%H:%M:%S")

# --------------------------------------------
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", 
     main = "Global Active Power")
# export to png
dev.copy(png, 'plot1.png', width = 504, height = 504)
dev.off()
