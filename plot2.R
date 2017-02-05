# Reading the table

power <- read.table("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,sep=";")

# Subsetting the data

powerdates <- subset(power, power$Date=="1/2/2007" | power$Date =="2/2/2007")
datetime <- strptime(paste(powerdates$Date,powerdates$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(powerdates$Global_active_power)

# Construction of plot2

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Saving to plot2.png

dev.copy(png,file="plot2.png", height=480, width=480)
dev.off()