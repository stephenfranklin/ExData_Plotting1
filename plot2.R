# plot2.R
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
View(power)
power$datetime<-paste(power$Date,power$Time)
power$datetime<-strptime(power$datetime,"%d/%m/%Y %H:%M")


plot(power$datetime,power$Global_active_power,type='l',
     ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png, file="plot2.png",width=480,height=480)
dev.off()
