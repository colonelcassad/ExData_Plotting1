
#read data from file
data <- read.csv("household_power_consumption.txt",sep=";",
                 colClasses = "character",na.strings = "?")

# converting and subsetting data
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data<-subset(data,Date >= "2007-02-01" & Date<="2007-02-02")
datetime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")


#open png file
png(filename = "plot2.png",width = 480, height = 480)

#plot graphic
with(data, plot(datetime,Global_active_power,type="l",
                xlab="",ylab="Global Active Power (kilowattes)"))


#close plot device
dev.off()
