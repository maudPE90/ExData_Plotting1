#reads the data
d <- read.csv2("household_power_consumption.txt", sep = ";", dec = ".")
#joint date and time columns and converts them into time type
d$DateTime <- paste(d$Date, d$Time)
d$DateTime <- strptime(d$DateTime, "%d/%m/%Y %H:%M:%S")

#recreate data frame
dat <- data.frame(DateTime = d$DateTime, cond = 1, EnergySubMetering = d$Sub_metering_1)
dat <- rbind(dat, data.frame(DateTime = d$DateTime, cond = 2, EnergySubMetering = d$Sub_metering_2))
dat <- rbind(dat, data.frame(DateTime = d$DateTime, cond = 3, EnergySubMetering = d$Sub_metering_3))
dat$cond <- factor(dat$cond)

#plot
png(file = "plot3.png")
par("mar" = c(2.1,4.1,2.1,2.1))
plot(dat$DateTime, dat$EnergySubMetering, type = "n", xlab = "", ylab = "Energy sub metering")
with(subset(dat, cond == 1), points(DateTime, EnergySubMetering, col = "black", type = "l"))
with(subset(dat, cond == 2), points(DateTime, EnergySubMetering, col = "red", type = "l"))
with(subset(dat, cond == 3), points(DateTime, EnergySubMetering, col = "blue", type = "l"))
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_meterin_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()