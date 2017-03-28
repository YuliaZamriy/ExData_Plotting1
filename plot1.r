library(data.table)
library(chron)
library(lubridate)

full_data <- fread("household_power_consumption.txt",
                   na.strings = "?")

full_data2 <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")
full_data2$DateD <- as.Date(full_data2$Date,"%d/%m/%Y")
full_data2$TimeT <- times(full_data2$Time)
full_data2$DateDT <- ymd_hms(strptime(paste(full_data2$Date,full_data2$Time),"%d/%m/%Y %H:%M:%S"))


# Plot 1

par(mfrow=c(1,1))

png(filename="plot1.png",
    width=480,
    height=480)

hist(full_data2$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.off()