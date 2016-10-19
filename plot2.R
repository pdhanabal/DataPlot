library(dplyr)
# Reading and Filtering Data
df<-read.csv("household_power_consumption.txt",header = TRUE,sep = ';',na.strings = "?")
pdata<-df[(df$Date=="1/2/2007" | df$Date=="2/2/2007"),]
tdata<-pdata%>%mutate(xdate=paste(Date,Time))
tdata$xdate<-strptime(tdata$xdate,format = "%d/%m/%Y %H:%M:%S")
# Open Graphic Device
png(file="plot2.png",width = 480, height = 480)
plot(tdata$xdate,tdata$Global_active_power,type='l',xlab='',ylab = "GlobalActive Power (kilowatts)")
# Close Graphic Device
dev.off()