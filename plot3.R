# Reading the table

power <- read.table("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,sep=";")

# subsetting the data

powerdates <- subset(power, power$Date=="1/2/2007" | power$Date =="2/2/2007")
datetime <- strptime(paste(powerdates$Date,powerdates$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(powerdates$Global_active_power)
subMetering1 <- as.numeric(powerdates$Sub_metering_1)
subMetering2 <- as.numeric(powerdates$Sub_metering_2)
subMetering3 <- as.numeric(powerdates$Sub_metering_3)

# Construction of plot3

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

# Creating a legend

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

# Saving to plot3.png 

dev.copy(png,file="plot3.png", height=480, width=480)
dev.off()
