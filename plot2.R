hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpcp <- hpc[hpc$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
hpcp$Global_active_power <- as.numeric(as.character(hpcp$Global_active_power))
#hpcp$Time <- strptime(hpcp$Time, format = "%H:%M:%S")

hpcp$Date1 <- strptime(paste(hpcp$Date,hpcp$Time), "%Y-%m-%d %H:%M:%S")

plot(hpcp$Date1, hpcp$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, "figure/plot2.png")
dev.off()