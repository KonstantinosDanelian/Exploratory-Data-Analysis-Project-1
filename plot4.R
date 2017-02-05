# Reading the table

power <- read.table("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,sep=";")

# Subsetting the data

powerdates <- subset(power, power$Date=="1/2/2007" | power$Date =="2/2/2007")
datetime <- strptime(paste(powerdates$Date,powerdates$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(powerdates$Global_active_power)
globalreactivepower <- as.numeric(powerdates$Global_reactive_power)
subMetering1 <- as.numeric(powerdates$Sub_metering_1)
subMetering2 <- as.numeric(powerdates$Sub_metering_2)
subMetering3 <- as.numeric(powerdates$Sub_metering_3)
voltage <- as.numeric(powerdates$Voltage)

# Construction of plot4

par(mfrow = c(2, 2))
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2,bty = "n", col=c("black", "red", "blue"))
plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Saving to plot4.png

dev.copy(png,file="plot4.png", height=480, width=480)
dev.off()