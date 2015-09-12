
#read data from file
data <- read.csv("household_power_consumption.txt",sep=";",
                 colClasses = "character",na.strings = "?")

# converting and subsetting data
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data<-subset(data,Date >= "2007-02-01" & Date<="2007-02-02")

#open png file
png(filename = "plot1.png",width = 480, height = 480)

#plot histogram
with(data, hist(as.numeric(Global_active_power,na.rm=TRUE),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)"))

#close plot device
dev.off()
