hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpcp <- hpc[hpc$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
hpcp$Global_active_power <- as.numeric(as.character(hpcp$Global_active_power))
hpcp$Sub_metering_1 <- as.numeric(as.character(hpcp$Sub_metering_1))
hpcp$Sub_metering_2 <- as.numeric(as.character(hpcp$Sub_metering_2))
hpcp$Sub_metering_3 <- as.numeric(as.character(hpcp$Sub_metering_3))

hpcp$Date1 <- strptime(paste(hpcp$Date,hpcp$Time), "%Y-%m-%d %H:%M:%S")

plot(hpcp$Date1, hpcp$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(hpcp$Date1, hpcp$Sub_metering_2, type = "l", ylab = "Energy sub metering", xlab = "", col = "red")
lines(hpcp$Date1, hpcp$Sub_metering_3, type = "l", ylab = "Energy sub metering", xlab = "", col = "blue")
dev.copy(png, "figure/plot3.png")
dev.off()