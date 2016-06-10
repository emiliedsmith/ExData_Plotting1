
#Unzip the file
unzip("exdata_data_household_power_consumption.zip", exdir = "./exdata_data_household_power_consumption")

#Create a function that loads, reads and subsets the data needed
load_data <- function() {
  filename <- "./exdata_data_household_power_consumption/household_power_consumption.txt"

  #Read the data  
  data <- read.table(filename, sep = ";", na = "?",
                     header = TRUE)
  #Set the column Date  
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  #Subset the data to real only the dates from 02/01/2007 to 02/02/2007
  subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  #Create a new column combining date and time
  subdata$newdate <- with(subdata, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
  
  #Check the top rows of subdata
  head(subdata)
}

#Plot 1


plot1 <- function() {
  
  #Check if subdata is already loaded and call the load_data function if not
  if(!exists('loadedData')){
    loadedData <<- load_data()
  }
  loadedData
  
  #Save plot as a png file with a width of 480 pixels and a height of 480 pixels.
  png("plot1.png", width=480, height=480)
  
  #Plot the histogram of subdata$Global_active_power
  hist(subdata$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
  
  #Shut down the graphic device
  dev.off()
  
}

#carry out the plot
plot1()