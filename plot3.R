library(dplyr)
# Reading and Filtering Data
df<-read.csv("household_power_consumption.txt",header = TRUE,sep = ';',na.strings = "?")
pdata<-df[(df$Date=="1/2/2007" | df$Date=="2/2/2007"),]
tdata<-pdata%>%mutate(xdate=paste(Date,Time))
tdata$xdate<-strptime(tdata$xdate,format = "%d/%m/%Y %H:%M:%S")
# Open Graphic Device
png(file="plot3.png",width = 480, height = 480)
plot(tdata$xdate,tdata$Sub_metering_1,type='l',xlab = "",ylab="Energy sub metering")
lines(tdata$xdate,tdata$Sub_metering_3,col="blue")
lines(tdata$xdate,tdata$Sub_metering_2,col="red")
legend("topright",pch = "--",col = c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Close Graphic Device
dev.off()