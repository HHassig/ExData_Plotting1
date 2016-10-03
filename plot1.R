# Get file
dataTxt <- "household_power_consumption.txt"
# Load data
data <- read.table(dataTxt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get only the dates we care about
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Subset
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Create png file with 480x480 dimensions
png("plot1.png", width=480, height=480)

# Label!
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Don't forget!
dev.off()