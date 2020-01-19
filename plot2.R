temp = tempfile()
download.file(url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',temp)
dframe <- read.table(unz(temp,"household_power_consumption.txt"),na.strings = "?", sep = ";", header = TRUE,
                     colClasses = c("character","character",rep("double",7)))
unlink(temp)

library(dplyr)

dframe1 <- dframe %>% filter(Date == '1/2/2007' | Date == '2/2/2007')

plot(as.POSIXct(paste(as.Date(dframe1$Date,'%d/%m/%Y'),dframe1$Time,sep= ' ')),
    as.numeric(dframe1$Global_active_power),
    type = "l", main = NA, xlab = NA,
     ylab = "Global Acive Power (killoWatts)",cex.lab = .8, col = "black")
dev.copy(png, "plot2.png",width = 480, height = 480)
dev.off()