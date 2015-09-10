#read original file into data.frame
ff <- read.table(file="./Data/household_power_consumption.txt", sep=';',na.strings=c("NA","?"), header=TRUE)

#subset data for just two days of observations
tt <- ff[ff$Date %in% c("1/2/2007","2/2/2007"),]

#create plot(histogram) to see distribution of Global_active_Power on the screen
hist(tt$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

#copy plot into file plot1.png
dev.copy(png, file = "plot1.png", width = 480, height = 480)

#close file
dev.off()


#  ------------------------------Optimization-----------------------------

#   For memory usage optimization:

#   The following block can be used instead of reading of full table followed by subsetting
#   Only necessary lines will be selected from the file depending on the values in field Date
#
#
#   library(R.utils)
#   filename <- "./Data/household_power_consumption.txt"
#   index <- readTableIndex(filename)  #just reads by default the first column in the file, to be indexed (Date)
#   keys <- c("1/2/2007","2/2/2007")   # this is the filter vector; for this assignment these two days are filtered
#   tt <- readTable(filename, rows=which(index%in%keys == TRUE), header=TRUE, sep=";", na.strings=c("NA","?"), colClasses=NA)