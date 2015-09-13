# Coursera Course Project 1 - Construct Plot1 
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

lower_bound <- strptime('2007-02-01', "%Y-%m-%d")
upper_bound <- strptime('2007-02-02', "%Y-%m-%d")

household_power_consumption$formattedDate <- strptime(household_power_consumption$Date, "%d/%m/%Y") 
hpc.subset <-household_power_consumption[household_power_consumption$formattedDate >= lower_bound & household_power_consumption$formattedDate <= upper_bound, ]

hpc.subset$Global_active_power.num <- type.convert(as.character(hpc.subset$Global_active_power), dec = ".")
hist(hpc.subset$Global_active_power.num, col="Red", main="Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.copy(png, file="~/plot1.png")
dev.off()


