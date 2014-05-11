#reads the data
d <- read.csv2("household_power_consumption.txt", sep = ";", dec = ".")
#joint date and time columns and converts them into time type
d$DateTime <- paste(d$Date, d$Time)
d$DateTime <- strptime(d$DateTime, "%d/%m/%Y %H:%M:%S")

#plots in png file
png(file = "plot2.png")
par("mar" = c(2.1,4,3,2.1))
plot(d$DateTime, d$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()