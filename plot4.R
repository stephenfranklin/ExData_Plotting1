# plot4.R
# 
zipfile <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url=zipfile,destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip", overwrite=T)
file <- "household_power_consumption.txt"
cols<-c("Date","Time","Global_active_power","Global_reactive_power",
        "Voltage","Global_intensity","Sub_metering_1",
        "Sub_metering_2","Sub_metering_3")
power <- read.table(file,header=T,sep=";",col.names=cols,
                    nrows=2880,skip=66636)
#View(power)
power$datetime<-paste(power$Date,power$Time)
power$datetime<-strptime(power$datetime,"%d/%m/%Y %H:%M")

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2)) # ,cex=0.65)
# plot2
plot(power$datetime,power$Global_active_power,type='l',
     ylab="Global Active Power",xlab="")

# plot voltage
plot(power$datetime,power$Voltage,type='l',
     ylab="Voltage",xlab="datetime")

# plot3
plot(power$datetime,power$Sub_metering_1,type='l',
     ylab="Energy sub metering",xlab="")
lines(power$datetime,power$Sub_metering_2,type='l',col="red")
lines(power$datetime,power$Sub_metering_3,type='l',col="blue")
ylabs<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", ylabs, lty=c(1,1,1), col=c("black","red","blue"),cex=1,bty="n")

# plot reactive power
plot(power$datetime,power$Global_reactive_power,type='l',
     ylab="Global_reactive_power",xlab="datetime")

#dev.copy(png, file="plot4.png",width=480,height=480)
dev.off()

