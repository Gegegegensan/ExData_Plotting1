# Global Active Power (kilowatts)

library(dplyr)

# If your locale is not in English
Sys.setenv("LANGUAGE"="En")
Sys.setlocale("LC_ALL", "English")

# Create a data table
data <- read.table(file = "C:\\projects\\_COURSERA\\Data-Science-JHU\\exploratory-analysis\\exdata_data_household_power_consumption\\household_power_consumption.txt", 
                header=TRUE, sep=";")
two_days <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

two_days$Date <- as.Date(two_days$Date, "%d/%m/%Y")
two_days <- mutate(two_days, Date_time = as.POSIXct(paste(two_days$Date, two_days$Time, sep=" "), template = "%d/%m/%Y %H:%M:%S", tz = Sys.timezone()))


# Initialize the plot size
par(mfrow=c(1,1))
plot(two_days$Global_active_power, type="n", xaxt="n", xlab="", ylab="Global Active Power (killowatts)")

# Draw a line
plot(x=two_days$Date_time, y = two_days$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Save the plot as a png image - it'll be saved under Documents folder if using Windows
dev.copy(png, file="plot2.png")
dev.off()
