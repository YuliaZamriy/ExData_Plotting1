library(data.table)
library(chron)
library(lubridate)

full_data <- fread("household_power_consumption.txt",
                   na.strings = "?")

full_data2 <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")
full_data2$DateD <- as.Date(full_data2$Date,"%d/%m/%Y")
full_data2$TimeT <- times(full_data2$Time)
full_data2$DateDT <- ymd_hms(strptime(paste(full_data2$Date,full_data2$Time),"%d/%m/%Y %H:%M:%S"))

# Plot 4

png(filename="plot4.png",
    width=480,
    height=480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(full_data2$DateDT,full_data2$Global_active_power,
     type="l",
     xaxt="n",
     ylab="Global Active Power (kilowatts)",
     xlab="")

axis(1,
     at = c(min(full_data2$DateDT),mean(full_data2$DateDT),max(full_data2$DateDT)),
     labels = c("Thu","Fri","Sat"))

plot(full_data2$DateDT,full_data2$Voltage,
     type="l",
     xaxt="n",
     ylab="Voltage",
     xlab="datetime")

axis(1,
     at = c(min(full_data2$DateDT),mean(full_data2$DateDT),max(full_data2$DateDT)),
     labels = c("Thu","Fri","Sat"))


plot(full_data2$DateDT,
     full_data2$Sub_metering_1,
     lwd=2,
     type="l",
     xaxt="n",
     ylab="Energy sub metering",
     xlab="")
lines(full_data2$DateDT,
      full_data2$Sub_metering_2,
      lwd=2,
      col="red")
lines(full_data2$DateDT,
      full_data2$Sub_metering_3,
      lwd=2,
      col="blue")
axis(1,
     at = c(min(full_data2$DateDT),mean(full_data2$DateDT),max(full_data2$DateDT)),
     labels = c("Thu","Fri","Sat"))
legend("topright",
       lty=c(1,1,1),
       lwd=c(2,2,2),
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(full_data2$DateDT,full_data2$Global_reactive_power,
     type="l",
     xaxt="n",
     ylab="Global_reactive_power",
     xlab="datetime")

axis(1,
     at = c(min(full_data2$DateDT),mean(full_data2$DateDT),max(full_data2$DateDT)),
     labels = c("Thu","Fri","Sat"))

dev.off()