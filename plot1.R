## This is the R code which creates the plot1.png file 


# First we read in the data
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",na="?")

# Next we convert the 'Date' column to a data object (now it's still a factor). 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Then we limit the data to the first two days of February 2007
data <- subset(data, data$Date %in% as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y")) 

# Now that we have our dataset ready, we open a png device and create the 'plot1.png' in the working directory
png("plot1.png", width = 480, height = 480, units = "px")

# We create the histogram showing the frequency distribution of the 'household global minute-averaged active power (in kilowatt)' 
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red") 

# Finally we close the graphics device 
dev.off()


