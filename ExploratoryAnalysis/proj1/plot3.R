## loading the data
fileurl = "data/household_power_consumption.txt"
data = read.table(fileurl, header=FALSE, sep=";", na.strings="?", 
                  skip=66637, nrows=2880,
                  col.names = c("Date","Time","Global_active_power","Global_reactive_power",
                                "Voltage","Global_intensity","Sub_metering_1",
                                "Sub_metering_2","Sub_metering_3"), 
                  colClasses = c("character","character","numeric","numeric",
                                 "numeric","numeric","numeric","numeric","numeric"))
## change the datetime format
data$datetime= strptime( paste(data$Date, data$Time),  format="%d/%m/%Y %H:%M:%S" )
 
## plot 
png(filename="plot3.png",width=480,height=480,units="px",bg = "transparent")
with(data, plot(datetime, Sub_metering_1, type="l", 
                ylab = "Energy sub metering", xlab ="" ) )
with(data, lines(datetime, Sub_metering_2, col="red" ) )
with(data, lines(datetime, Sub_metering_3, col="blue" ) )
legend("topright",lwd=1,col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
dev.off()