
#read data from file
data <- read.csv("household_power_consumption.txt",sep=";",
                 colClasses = "character",na.strings = "?")

# converting and subsetting data
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data<-subset(data,Date >= "2007-02-01" & Date<="2007-02-02")
datetime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")


#open png file
png(filename = "plot4.png",width = 480, height = 480)

#plot graphics
par(mfrow=c(2,2))
with(data, 
     { 
       plot(datetime,Global_active_power,type="l",
            xlab="",ylab="Global Active Power (kilowattes)")
       
       plot(datetime,Voltage,type="l")
       
       plot(datetime,Sub_metering_1,type="l",
            xlab="",ylab="Energy sub metering");
       points(datetime,Sub_metering_2,type="l",col="red");
       points(datetime,Sub_metering_3,type="l",col="blue")
       legend("topright",
              c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
              lty=c(1,1,1),
              col=c("black","red","blue"))
       plot(datetime,Global_reactive_power,type="l")
     }
)


#close plot device
dev.off()
