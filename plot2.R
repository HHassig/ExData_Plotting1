# Get file
dataTxt <- "household_power_consumption.txt"

# Load data
data <- read.table(dataTxt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Get dates we want by subsetting
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Set up
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Plot and Label
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Don't forget!
dev.off()