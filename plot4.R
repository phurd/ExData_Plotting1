# Coursera Course Project 1 - Construct Plot2 
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

lower_bound <- strptime('2007-02-01 00:00:00', "%Y-%m-%d %H:%M:%S")
upper_bound <- strptime('2007-02-03 00:00:00', "%Y-%m-%d %H:%M:%S")

household_power_consumption$Datetime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
hpc.subset <-household_power_consumption[household_power_consumption$Datetime >= lower_bound & household_power_consumption$Datetime < upper_bound, ]

#casting columns of interest to numerics
hpc.subset$Global_active_power.num <- type.convert(as.character(hpc.subset$Global_active_power), dec = ".")
hpc.subset$Voltage.num <- type.convert(as.character(hpc.subset$Voltage), dec = ".")
hpc.subset$Global_reactive_power.num <- type.convert(as.character(hpc.subset$Global_reactive_power), dec = ".")
hpc.subset$Sub_metering_1.num <- type.convert(as.character(hpc.subset$Sub_metering_1), dec = ".", na.strings = "?")
hpc.subset$Sub_metering_2.num <- type.convert(as.character(hpc.subset$Sub_metering_2), dec = ".", na.strings = "?")
hpc.subset$Sub_metering_3.num <- type.convert(as.character(hpc.subset$Sub_metering_3), dec = ".", na.strings = "?")

par(mfrow=c(2,2))

with(hpc.subset,
     plot(Datetime, Global_active_power.num, type="l", ylab = "Global Active Power(Kilowatts)", xlab=""))
with(hpc.subset,
     plot(Datetime, Voltage.num, type="l", ylab = "Voltage", xlab=""))
with(hpc.subset,
     plot(Datetime, Sub_metering_1.num, type="n", ylab = "Energy Sub Metering", xlab=""))
with(hpc.subset,
     lines(Datetime, Sub_metering_1.num, col="Black"))
with(hpc.subset,
     lines(Datetime, Sub_metering_2.num, col="Red"))
with(hpc.subset,
     lines(Datetime, Sub_metering_3.num, col="Blue"))
legend("topright", pch="-", col=c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(hpc.subset,
     plot(Datetime, Global_reactive_power.num, type="l", ylab = "Global_Reactive_Power", xlab="datetime")
)

dev.copy(png, file="~/plot4.png")
dev.off()
