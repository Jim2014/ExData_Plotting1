plot1<-function()
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

  # draw Plot 
  par(mfrow = c(1, 1))
  hist (data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file = "plot1.png", width = 480, height = 480)
  dev.off()

}

plot1()