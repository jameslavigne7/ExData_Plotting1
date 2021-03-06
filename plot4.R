temp = tempfile()
download.file(url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',temp)
dframe <- read.table(unz(temp,"household_power_consumption.txt"),na.strings = "?", sep = ";", header = TRUE,
                     colClasses = c("character","character",rep("double",7)))
unlink(temp)

library(dplyr)

dframe1 <- dframe %>% filter(Date == '1/2/2007' | Date == '2/2/2007')

par(mfrow = c(2,2),mar = c(4,4,.1,1))

x <- as.POSIXct(paste(as.Date(dframe1$Date,'%d/%m/%Y'),dframe1$Time,sep= ' '))

plot(x,
     dframe1$Global_active_power,
     type = "l", main = NA, xlab = NA,
     ylab = "Global Acive Power (killoWatts)",cex.lab = .8, col = "black")

plot(x,
     dframe1$Voltage,
     type = "l", main = NA, xlab = "datetime",
     ylab = "Voltage",cex.lab = .8, col = "black")

plot(x,
     dframe1$Sub_metering_1,
     type = "l", main = NA, xlab = NA,
     ylab = "Energy sub metering",cex.lab = .8, col = "purple")
lines(x,
      dframe1$Sub_metering_2,
      type = "l", main = NA, xlab = NA,
      ylab = "Energy sub metering",cex.lab = .8, col = "red")
lines(x,
      dframe1$Sub_metering_3,
      type = "l", main = NA, xlab = NA,
      ylab = "Energy sub metering",cex.lab = .8, col = "blue")
legend("topright",col = c("purple","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 2.5,cex = .4)

plot(x,
     dframe1$Global_reactive_power, ylab = "Global_reactive_power",
     type = "l", main = NA, xlab = "datetime",cex.lab = .8, col = "black")

dev.copy(png,"plot4.png",width = 480,height = 480)
dev.off()