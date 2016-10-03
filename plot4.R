# Get file
dataTxt <- "household_power_consumption.txt"

# Load data
data <- read.table(dataTxt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get dates we want
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Get what we want by subsetting
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Plot with desired dimensions and file type
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Plot4.1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plot4.2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 4.3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Plot 4.4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()