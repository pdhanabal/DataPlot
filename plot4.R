library(dplyr)
# Reading and Filtering Data
df<-read.csv("household_power_consumption.txt",header = TRUE,sep = ';',na.strings = "?")
pdata<-df[(df$Date=="1/2/2007" | df$Date=="2/2/2007"),]
tdata<-pdata%>%mutate(xdate=paste(Date,Time))
tdata$xdate<-strptime(tdata$xdate,format = "%d/%m/%Y %H:%M:%S")
# Open Graphic Device
png(file="plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2))
#1
plot(tdata$xdate,tdata$Global_active_power,type='l',xlab='',ylab = "GlobalActive Power")
#2
plot(tdata$xdate,tdata$Voltage,type='l',xlab='datetime',ylab = "Voltage")
#3
plot(tdata$xdate,tdata$Sub_metering_1,type='l',xlab = "",ylab="Energy sub metering")
lines(tdata$xdate,tdata$Sub_metering_3,col="blue")
lines(tdata$xdate,tdata$Sub_metering_2,col="red")
legend("topright",pch = "--",col = c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#4
plot(tdata$xdate,tdata$Global_reactive_power,type='l',xlab='datetime',ylab = "Global_reactive_power")
# Close Graphic Device
dev.off()