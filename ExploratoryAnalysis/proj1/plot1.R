## loading the data
fileurl = "data/household_power_consumption.txt"
data = read.table(fileurl, header=FALSE, sep=";", na.strings="?", 
                  skip=66637, nrows=2880,
                  col.names = c("Date","Time","Global_active_power","Global_reactive_power",
                                "Voltage","Global_intensity","Sub_metering_1",
                                "Sub_metering_2","Sub_metering_3"), 
                  colClasses = c("character","character","numeric","numeric",
                                 "numeric","numeric","numeric","numeric","numeric"))

## plot 
png(filename="plot1.png",width=480,height=480,units="px",bg = "transparent")
hist(data$Global_active_power,col="red", main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()