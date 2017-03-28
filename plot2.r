library(data.table)
library(chron)
library(lubridate)

full_data <- fread("household_power_consumption.txt",
                   na.strings = "?")

full_data2 <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")
full_data2$DateD <- as.Date(full_data2$Date,"%d/%m/%Y")
full_data2$TimeT <- times(full_data2$Time)
full_data2$DateDT <- ymd_hms(strptime(paste(full_data2$Date,full_data2$Time),"%d/%m/%Y %H:%M:%S"))

# Plot 2

png(filename="plot2.png",
    width=480,
    height=480)

plot(full_data2$DateDT,full_data2$Global_active_power,
     type="l",
     xaxt="n",
     ylab="Global Active Power (kilowatts)",
     xlab="")

axis(1,
     at = c(min(full_data2$DateDT),mean(full_data2$DateDT),max(full_data2$DateDT)),
     labels = c("Thu","Fri","Sat"))

dev.off()