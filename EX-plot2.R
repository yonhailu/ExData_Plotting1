####EX-plot2
unzip("C:/Users/Yonathan/Desktop/Coursera/data/exdatadatahousehold_power_consumption.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)

unzip(zipfile="C:/Users/Yonathan/Desktop/Coursera/data/exdatadatahousehold_power_consumption.zip", exdir="./data")

# Reading text 
power <- read.table("household_power_consumption.txt", header=T, sep=";")

# we could also name them using the following command 
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting
subsetdata <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

## transforming date and time 
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subsetdata$Global_active_power)

## Plot 
plot(datetime, globalactivepower,main="Global Active Power", type="l", xlab="", ylab="Global Active Power (kilowatts)")
