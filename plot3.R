#Read in data
data<- read.csv.sql("household_power_consumption.txt", 
    sql= "select * from file where Date in ('1/2/2007','2/2/2007')",
          header = TRUE, sep = ";")

# Create png file
png(file = "plot3.png", width = 480, height = 480)

#Create date variable
data$datetime <- strptime(paste(data$Date, data$Time), 
    format = "%d/%m/%Y %H:%M:%S")    

#Create Plot 
plot(data$datetime, data$Sub_metering_1, type = "n", xlab = "",
    ylab = "Energy sub metering")
points(data$datetime, data$Sub_metering_1, type = "l", col = "black")
points(data$datetime, data$Sub_metering_2, type = "l", col = "red")
points(data$datetime, data$Sub_metering_3, type = "l", col = "blue")

legend("topright",  lty = 1, col = c("black", "red", "blue"), 
    legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()

