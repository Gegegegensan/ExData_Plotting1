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
par(mfrow=c(2,2))

# Create the first plot
plot(x=two_days$Date_time, y=two_days$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Create the second plot
plot(two_days$Date_time, y=two_days$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Create the third plot
plot(x=two_days$Date_time, y =two_days$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(x=two_days$Date_time, y =two_days$Sub_metering_2, type="l", col="red")
lines(x=two_days$Date_time, y =two_days$Sub_metering_3, type="l", col="blue")
legend("topright", lty="solid", bty = "n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create the forth plot
plot(two_days$Date_time, y=two_days$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Save the plot as a png image - it'll be saved under Documents folder if using Windows
dev.copy(png, file="plot4.png")
dev.off()