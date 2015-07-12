# Load household_power_consmption dataset and convert Date column
data_all <- read.csv('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?')
data_all$Date <- as.Date(data_all$Date, format='%d/%m/%Y')

# Subset dataset and convert time column
data <- data_all[data_all$Date>='2007-02-01' & data_all$Date<='2007-02-02',]
data$Time <- strptime(paste(data$Date, data$Time), format='%Y-%m-%d %H:%M:%S', tz='')

# Create Plot #3
with(data, {
  plot(Time, Sub_metering_1, ylab='Energy sub metering', xlab='', type='l')
  lines(Time, Sub_metering_2, col='red')
  lines(Time, Sub_metering_3, col='blue')
})
legend('topright', col=c('black', 'red', 'blue'), lty=1, 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3  '))

# Export Plot #3 to PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
