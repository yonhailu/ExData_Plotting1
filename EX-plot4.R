######## Plot4 
unzip("C:/Users/Yonathan/Desktop/Coursera/data/exdatadatahousehold_power_consumption.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)

unzip(zipfile="C:/Users/Yonathan/Desktop/Coursera/data/exdatadatahousehold_power_consumption.zip", exdir="./data")

# Reading text 
power <- read.table("household_power_consumption.txt", header=T,sep=";")

# we could also name them using the following command 
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting
subsetdata <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

## transforming the date and time 
subsetdata$Date <- as.Date(subsetdata $Date, format="%d/%m/%Y")
subsetdata$Time <- strptime(subsetdata$Time, format="%H:%M:%S")
subsetdata[1:1440,"Time"] <- format(subsetdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetdata[1441:2880,"Time"] <- format(subsetdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

###intiating a composite plot with different graphs 
par(mfrow=c(2,2))

with(subsetdata,{
  plot(subsetdata$Time,as.numeric(as.character(subsetdata$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subsetdata$Time,as.numeric(as.character(subsetdata$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subsetdata$Time,subsetdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subsetdata$Time,as.numeric(as.character(subsetdata$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
