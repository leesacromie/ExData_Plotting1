#Read in data
data<- read.csv.sql("household_power_consumption.txt", 
    sql= "select * from file where Date in ('1/2/2007','2/2/2007')",
          header = TRUE, sep = ";")

# Create png file
png(file = "plot2.png", width = 480, height = 480)

#Create date variable
data$datetime <- strptime(paste(data$Date, data$Time), 
          format = "%d/%m/%Y %H:%M:%S")    

#Create Plot
plot(data$datetime, data$Global_active_power, 
          type = "l", xlab = "", ylab= "Global Active Power (kilowatts)")

dev.off()

