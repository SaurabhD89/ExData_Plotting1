# knowing the directory
getwd()
setwd("C:/Users/Saurabh/Desktop/Coursera/Exploratory Data Analysis")

# reading the data
ls()
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")# to remove blanks

# convert the date variable to date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# plot 1
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# saving file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()#going back to the plot window
