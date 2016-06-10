#Plot 3

plot3 <- function() {
  
  #Check if subdata is already loaded and call the load_data function if not
  if(!exists('loadedData')){
    loadedData <<- load_data()
  }
  loadedData
  
  #Save plot as a png file with a width of 480 pixels and a height of 480 pixels.
  png("plot3.png", width=480, height=480)
  
  #Setting the x and y axis for the 3 plots
  y1 <- subdata$Sub_metering_1
  y2 <- subdata$Sub_metering_2
  y3 <- subdata$Sub_metering_3
  x <- subdata$newdate

  #Creating a blank plot
  with(subdata, plot(newdate, Sub_metering_1, type = "n", 
                   xlab = " ", ylab = "Energy sub metering"))

  #Adding 3 plots with different colors
  points(x, y1, type = "l")
  points(x, y2, type = "l", col = "red")
  points(x, y3, type = "l", col = "blue")

  #Adding the legend
  legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), 
       col = c("black", "red", "blue"))

  #Shut down the graphic device
  dev.off()
  
}

#carry out the plot
plot3()