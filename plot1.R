#Read in data
data<- read.csv.sql("household_power_consumption.txt", 
    sql= "select * from file where Date in ('1/2/2007','2/2/2007')",
    header = TRUE, sep = ";")

# Create png file
png(file = "plot1.png", width = 480, height = 480)

# Create Plot
with(data, hist(Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

dev.off() 