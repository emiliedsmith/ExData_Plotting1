#Plot 2

plot2 <- function() {
  
  #Check if subdata is already loaded and call the load_data function if not
  if(!exists('loadedData')){
    loadedData <<- load_data()
  }
  loadedData

  #Save plot as a png file with a width of 480 pixels and a height of 480 pixels.
  png("plot2.png", width=480, height=480)


  #Create a plot of new date vs Global_active-power
  with(subdata, plot(newdate, Global_active_power, 
      type = "l", 
      xlab = " ", 
      ylab = "Global Active Power (kilowatts)"))
  
  #Shut down the graphic device
  dev.off()
  
}

#carry out the plot
plot2()