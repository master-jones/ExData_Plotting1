# Load household_power_consmption dataset and convert Date column
data_all <- read.csv('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?')
data_all$Date <- as.Date(data_all$Date, format='%d/%m/%Y')

# Subset dataset and convert time column
data <- data_all[data_all$Date>='2007-02-01' & data_all$Date<='2007-02-02',]
data$Time <- strptime(paste(data$Date, data$Time), format='%Y-%m-%d %H:%M:%S', tz='')

# Create Plot #4
par(mfrow=c(2,2), mar=c(4,4,4,1), oma=c(0,0,2,1), cex=0.65)
with(data, {
  plot(Time, Global_active_power, ylab='Global Active Power', xlab='', type='l')
  plot(Time, Voltage, ylab='Voltage', xlab='datetime', type='l')
  plot(Time, Sub_metering_1, ylab='Energy sub metering', xlab='', type='l')
  lines(Time, Sub_metering_2, col='red')
  lines(Time, Sub_metering_3, col='blue')
  legend('topright', col=c('black', 'red', 'blue'), lty=1, bty='n',
         legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3  '))
  plot(Time, Global_reactive_power, ylab='Global_reactive_power', xlab='datetime', type='l')
})

# Export Plot #4 to PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


