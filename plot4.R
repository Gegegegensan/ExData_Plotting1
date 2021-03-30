#Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 
# Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.

# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

# The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of 
# how much memory the dataset will require in memory before reading into R. 
# Make sure your computer has enough memory (most modern computers should be fine).

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# One alternative is to read the data from just those dates rather than reading in 
# the entire dataset and subsetting to those dates.

# You may find it useful to convert the Date and Time variables to Date/Time classes 
# in R using the \color{red}{\verb|strptime()|}strptime()  
# and \color{red}{\verb|as.Date()|}as.Date() functions.


# Global Active Power
# Voltage
# Energy sub metering
# Global_reactive_power



# Create a data table
data <- read.table(file = "C:\\projects\\_COURSERA\\Data-Science-JHU\\exploratory-analysis\\exdata_data_household_power_consumption\\household_power_consumption.txt", 
                   header=TRUE, sep=";")
two_days <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
two_days$Date <- as.Date(two_days$Date, "%d/%m/%Y")
two_days <- mutate(two_days, Date_time = as.POSIXct(paste(two_days$Date, two_days$Time, sep=" "), 
                                                    template = "%d/%m/%Y %H:%M:%S", tz = Sys.timezone()))


# Initialize the plot size
par(mfrow=c(1,1))
plot(two_days$Sub_metering_1, type="n", xaxt="n")

## Create the first plot

## Create the second plot

## Create the third plot

# Draw a line
plot(x=two_days$Date_time, y =two_days$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(x=two_days$Date_time, y =two_days$Sub_metering_2, type="l", col="red")
lines(x=two_days$Date_time, y =two_days$Sub_metering_3, type="l", col="blue")
legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create the forth plot

# Save the plot as a png image - it'll be saved under Documents folder if using Windows
dev.copy(png, file="plot4.png")
dev.off()