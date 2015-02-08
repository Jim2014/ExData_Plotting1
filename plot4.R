plot4<-function()
{
  Sys.setlocale("LC_TIME", "English") 
  
  # read data from file
  dataAll <- read.csv("household_power_consumption.txt",sep=";", header=TRUE, na.string="?")
  
  # filter suset data 
  dataAll$Date <- as.Date(dataAll$Date, format="%d/%m/%Y" )
  data <- subset(dataAll, Date=="2007-02-01" | Date=="2007-02-02" )
  
  # deal with data type
  data$DateTime <- as.POSIXct(strptime(paste(as.character(data$Date ),as.character(data$Time) ), "%Y-%m-%d %H:%M:%S"))
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
  data$DateTime <- as.POSIXct(strptime(paste(as.character(data$Date ),as.character(data$Time) ), "%Y-%m-%d %H:%M:%S"))
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  data$Voltage <- as.numeric(data$Voltage)
  
  # draw Plot 
  par(mfrow = c(2, 2))
  
  plot( data$DateTime, data$Global_active_power, type ='l', xlab="", ylab="Global Active Power")
  
  plot( data$DateTime, data$Voltage, type ='l', xlab="datetime", ylab="Voltage")
  
  plot( data$DateTime, data$Sub_metering_1, type ='l', xlab="", ylab="Energy Sub metering")
  lines(data$DateTime, data$Sub_metering_2, type ='l',col="red")
  lines(data$DateTime, data$Sub_metering_3, type ='l',col="blue")
  legend("topright",  col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1)
  
  plot( data$DateTime, data$Global_reactive_power, type ='l', xlab="datetime", ylab="Global_reactive_power")
  
  dev.copy(png, file = "plot4.png", width = 480, height = 480)
  dev.off()
  
  
}
plot4()