# Energy sub metering

# Create a data table
data <- read.table(file = "C:\\projects\\_COURSERA\\Data-Science-JHU\\exploratory-analysis\\exdata_data_household_power_consumption\\household_power_consumption.txt", 
                   header=TRUE, sep=";")
two_days <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
two_days$Date <- as.Date(two_days$Date, "%d/%m/%Y")
two_days <- mutate(two_days, Date_time = as.POSIXct(paste(two_days$Date, two_days$Time, sep=" "), template = "%d/%m/%Y %H:%M:%S", tz = Sys.timezone()))


# Initialize the plot size
par(mfrow=c(1,1))
plot(two_days$Sub_metering_1, type="n", xaxt="n")

# Draw a line
plot(x=two_days$Date_time, y =two_days$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(x=two_days$Date_time, y =two_days$Sub_metering_2, type="l", col="red")
lines(x=two_days$Date_time, y =two_days$Sub_metering_3, type="l", col="blue")

legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Save the plot as a png image - it'll be saved under Documents folder if using Windows
dev.copy(png, file="plot3.png")
dev.off()



##
plot(airquality$Wind, airquality$Ozone, type="n")
title(main="Wind and Ozone in NYC")
may <- subset(airquality, Month==5)
points(may$Wind, may$Ozone, col="blue", pch=17)
notmay <- subset(airquality, Month != 5)
points(notmay$Wind, notmay$Ozone, col="red", pch=8)
legend("topright", pch=c(17,8), col=c("blue", "red"), legend=c("May", "Other Months"))
abline(v=median(airquality$Wind), lty=2, lwd=2)

##
par(mfrow=c(1,2))
plot(airquality$Wind, airquality$Ozone, main="Ozone and Wind")
plot(airquality$Ozone, airquality$Solar.R, main="Ozone and Solar Radiation")

##
par(mfrow=c(1,3), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(airquality$Wind, airquality$Ozone, main="Ozone and Wind")
plot(airquality$Solar.R, airquality$Ozone, main="Ozone and Solar Radiation")
plot(airquality$Temp, airquality$Ozone, main="Ozone and Temperature")
mtext("Ozone and Weather in New York City", outer=TRUE)


