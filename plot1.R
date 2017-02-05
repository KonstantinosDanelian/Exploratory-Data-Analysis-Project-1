# Reading the table

power <- read.table("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,sep=";")

# Subsetting the data

powerdates <- subset(power, power$Date=="1/2/2007" | power$Date =="2/2/2007")
globalactivepower <- as.numeric(powerdates$Global_active_power)

# Construction of plot1

hist(globalactivepower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Saving to plot1.png

dev.copy(png,file="plot1.png", height=480, width=480)
dev.off()