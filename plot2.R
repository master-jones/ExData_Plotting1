# Load household_power_consmption dataset and convert Date column
data_all <- read.csv('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?')
data_all$Date <- as.Date(data_all$Date, format='%d/%m/%Y')

# Subset dataset and convert time column
data <- data_all[data_all$Date>='2007-02-01' & data_all$Date<='2007-02-02',]
data$Time <- strptime(paste(data$Date, data$Time), format='%Y-%m-%d %H:%M:%S', tz='')

# Create Plot #2
plot(data$Time, data$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Export Plot #2 to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()