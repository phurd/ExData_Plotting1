# Coursera Course Project 1 - Construct Plot2 
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

lower_bound <- strptime('2007-02-01 00:00:00', "%Y-%m-%d %H:%M:%S")
upper_bound <- strptime('2007-02-03 00:00:00', "%Y-%m-%d %H:%M:%S")

household_power_consumption$Datetime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
hpc.subset <-household_power_consumption[household_power_consumption$Datetime >= lower_bound & household_power_consumption$Datetime < upper_bound, ]

hpc.subset$Global_active_power.num <- type.convert(as.character(hpc.subset$Global_active_power), dec = ".")
plot(hpc.subset$Datetime, hpc.subset$Global_active_power.num, type="l", ylab = "Global Active Power(Kilowatts)", xlab="")

dev.copy(png, file="~/plot2.png")
dev.off()


