d <- read.csv2("household_power_consumption.txt", sep = ";", dec = ".")
d$Date <- as.Date(d$Date)

png(file = "plot1.png")
hist(d$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()