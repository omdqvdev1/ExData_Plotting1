#read original file into data.frame
ff <- read.table(file="./Data/household_power_consumption.txt", sep=';',na.strings=c("NA","?"), header=TRUE)

#subset data for just two days of observations
tt <- ff[ff$Date %in% c("1/2/2007","2/2/2007"),]

#Transform field Date into Date format
tt$Date <- as.Date(tt$Date,"%e/%m/%Y")

#Transform Time to have one variable for Date and Time on X-axis in the plot
tt$Time <- as.POSIXct(paste(as.character(tt$Date), tt$Time))

#create plots to see measurements of different submeterings on the same picture
#save directly in file, however it is possible to draw it first on the screen and then copy to file
png("plot3.png",width = 480, height = 480, units = "px", bg = "white")

#the same window for all meterings
par(mfrow=c(1,1), mar=c(4,4,4,3)) 
with(tt, plot(Time, Sub_metering_1, type="l", col="black", ylab="Energy sub metering",xlab=""))
with(tt, points(Time, Sub_metering_2, type = "l", col="red"))
with(tt, points(Time, Sub_metering_3, type = "l", col="blue"))
legend("topright",lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#close file
dev.off()
