# Global Active Power

library(datasets)

# Create a data table
data <- read.table(file = "C:\\projects\\_COURSERA\\Data-Science-JHU\\exploratory-analysis\\exdata_data_household_power_consumption\\household_power_consumption.txt", 
              header=TRUE, sep=";")
two_days <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# Initialize the plot
par(mfrow=c(1,1))
plot(two_days$Global_active_power, type="n", xaxt="n", xlab="", ylab="Global Active Power (killowatts)")

# Draw a plot
hist(as.numeric(two_days$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (killowatts)", ylab="Frequency")

# Save the plot as a png image  - it'll be saved under Documents folder if using Windows
dev.copy(png, file="plot1.png")
dev.off()