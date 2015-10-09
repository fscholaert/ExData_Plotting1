## This is the R code which creates the plot3.png file 


# First we read in the data
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",na="?")

# We convert the 'Time' and 'Date' columns to respectively a DateTime and a Date object:  
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Then we limit the data to the first two days of February 2007
data <- subset(data, data$Date %in% as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y")) 

# Now that we have our dataset ready, we open a png device and create the 'plot3.png' in the working directory
png("plot3.png", width = 480, height = 480, units = "px")

# We set to time locale to English (to have the x-axis with the weekdays in English)
Sys.setlocale("LC_TIME", "English")

# We plot the 3 energy submetering, as a line graph over Time, each in a different colour,
# the first line is immediately plotted and the second and third line are added by annotating the original plot,
# finally a legend is being added: 
plot(data$Time, data$Sub_metering_1, type="l", xlab="", col="black", ylab="Energy sub metering") 
lines(data$Time, data$Sub_metering_2, col="red") 
lines(data$Time, data$Sub_metering_3, col="blue") 
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1) 

# In the end we close the graphics device 
dev.off()


