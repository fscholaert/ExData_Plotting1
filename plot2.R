## This is the R code which creates the plot2.png file 


# First we read in the data
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",na="?")

# We convert the 'Time' and 'Date' columns to respectively a DateTime and a Date object:  
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Then we limit the data to the first two days of February 2007
data <- subset(data, data$Date %in% as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y")) 

# Now that we have our dataset ready, we open a png device and create the 'plot2.png' in the working directory
png("plot2.png", width = 480, height = 480, units = "px")

# We set to time locale to English (to have the x-axis with the weekdays in English)
Sys.setlocale("LC_TIME", "English")

# We plot the 'household global minute-averaged active power (in kilowatt)' over the time variable, as a line graph
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

# Finally we close the graphics device 
dev.off()


