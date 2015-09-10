#read original file into data.frame
ff <- read.table(file="./Data/household_power_consumption.txt", sep=';',na.strings=c("NA","?"), header=TRUE)

#subset data for just two days of observations
tt <- ff[ff$Date %in% c("1/2/2007","2/2/2007"),]

#Transform field Date into Date format
tt$Date <- as.Date(tt$Date,"%e/%m/%Y")

#Transform Time into DateTime to have one variable for Date and Time on X-axis in the plot
tt$Time <- as.POSIXct(paste(as.character(tt$Date), tt$Time))

#create plot(lines) to see measurements of Global_active_power on timescale
plot(tt$Time, tt$Global_active_power,type="l", ylab = "Global Active Power (kilowatts)", xlab="")

#save plot in png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)

#close file
dev.off()