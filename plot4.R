#read original file into data.frame
ff <- read.table(file="./Data/household_power_consumption.txt", sep=';',na.strings=c("NA","?"), header=TRUE)

#subset data for just two days of observations
tt <- ff[ff$Date %in% c("1/2/2007","2/2/2007"),]

#Transform field Date into Date format
tt$Date <- as.Date(tt$Date,"%e/%m/%Y")

#Transform Time to have one variable for Date and Time on X-axis in the plots
tt$Time <- as.POSIXct(paste(as.character(tt$Date), tt$Time))

#save directly in file, however it is possible to draw it first on the screen and then copy to file
png("plot4.png",width = 480, height = 480, units = "px", bg = "white")

# split plotting area on 4 parts
par(mfrow=c(2,2)) 

# plot #1 for Global_active_power
plot(tt$Time, tt$Global_active_power,type="l", ylab = "Global Active Power", xlab="")

# plot#2  for Voltage
plot(tt$Time, tt$Voltage,type="l", ylab = "Voltage", xlab="datetime")

# plot#3   For 3 submeterings
with(tt, plot(Time, Sub_metering_1, type="l", col="black", ylab="Energy sub metering",xlab=""))
with(tt, points(Time, Sub_metering_2, type = "l", col="red"))
with(tt, points(Time, Sub_metering_3, type = "l", col="blue"))
legend("topright",lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.font=1, bty="n", yjust=1)

# plot#4 for Global_reactive_power
plot(tt$Time, tt$Global_reactive_power,type="l", ylab = "Global_reactive_power", xlab="datetime")

#Close file
dev.off()
