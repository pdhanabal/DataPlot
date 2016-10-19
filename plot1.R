# Reading and Filtering Data
df<-read.csv("household_power_consumption.txt",header = TRUE,sep = ';',na.strings = "?")
pdata<-df[(df$Date=="1/2/2007" | df$Date=="2/2/2007"),]
# Open Graphic Device
png(file="plot1.png",width = 480, height = 480)
# Histogram
hist(as.numeric(pdata$Global_active_power),col="red",main ="Global Active Power",xlab = "Global Active Power (kilowatts)")
# Close Graphic Device
dev.off()