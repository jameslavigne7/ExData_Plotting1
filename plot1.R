temp = tempfile()
download.file(url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',temp)
dframe <- read.table(unz(temp,"household_power_consumption.txt"),na.strings = "?", sep = ";", header = TRUE,
                     colClasses = c("character","character",rep("double",7)))
unlink(temp)

library(dplyr)

dframe1 <- dframe %>% filter(Date == '1/2/2007' | Date == '2/2/2007')

hist(as.numeric(dframe1$Global_active_power),main = "Global Active Power",cex.main = .9,
     xlab = "Global Acive Power (killoWatts)",cex.lab = .8, breaks = seq(0,10,.5),
     xlim = c(0,6), col = "red", ylim = c(0,1200))

dev.copy(png, "ExData_Plotting1/plot1.png",width = 480, height = 480)
dev.off()