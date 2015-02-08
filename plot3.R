plot3<-function()
{
  Sys.setlocale("LC_TIME", "English") 
  
  # read data from file
  dataAll <- read.csv("household_power_consumption.txt",sep=";", header=TRUE, na.string="?")
  
  # filter suset data 
  dataAll$Date <- as.Date(dataAll$Date, format="%d/%m/%Y" )
  data <- subset(dataAll, Date=="2007-02-01" | Date=="2007-02-02" )
  
  # deal with data type
  data$DateTime <- as.POSIXct(strptime(paste(as.character(data$Date ),as.character(data$Time) ), "%Y-%m-%d %H:%M:%S"))
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  
  # draw Plot 
  par(mfrow = c(1, 1))
  
  #plot( data$DateTime, data$Sub_metering_1, type ='l', xlab="", ylab="Energy Sub metering")
  #lines(data$DateTime, data$Sub_metering_2, type ='l',col="red")
  #lines(data$DateTime, data$Sub_metering_3, type ='l',col="blue")
  #legend("topright",  col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1)
  
  plot( data$DateTime, data$Sub_metering_1, type ='l', xlab="", ylab="Energy Sub metering")
  lines(data$DateTime, data$Sub_metering_2, col="red")
  lines(data$DateTime, data$Sub_metering_3, col="blue")
  legend_text=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
  legend("topright", lty=1, lwd=1, col = c("black", "blue", "red"), legend = legend_text, cex=0.8)
  
  
  dev.copy(png, file = "plot3.png", width = 480, height = 480)
  dev.off()
  
  
}
plot3()