hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpcp <- hpc[hpc$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
hpcp$Global_active_power <- as.numeric(as.character(hpcp$Global_active_power))

hist(hpcp$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

