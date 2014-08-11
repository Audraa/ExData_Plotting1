## ##############################################################################################
## set you working directory use setwd
## Ensure that the text file has been downloaded from the website into your working directory
## Read in the data
## If the data has already been read in to h no need to run this line again. 
## ##############################################################################################
h<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

## convert Date to a class date
h$Date <- as.Date(h$Date,"%d/%m/%Y") 

##create a new datetime field 
h$DateTime <- strptime(paste(h$Date,h$Time), "%Y-%m-%d %H:%M:%S")
## ##############################################################################################
#
# Get the subset data and store it in variable x
# Convert the necessary data to numeric
#############################################################################
x<- subset(h,Date=="2007-02-01" | Date=="2007-02-02")

#Now convert the following factor data to numeric. To do this first converty to characther and then numeric.
x$Global_active_power <-as.character(x$Global_active_power)
x$Global_active_power <-as.numeric(x$Global_active_power)
x$Global_reactive_power <-as.character(x$Global_reactive_power)
x$Global_reactive_power <-as.numeric(x$Global_reactive_power)
x$Voltage<-as.character(x$Voltage)
x$Voltage<-as.numeric(x$Voltage)
x$Sub_metering_1 <- as.character(x$Sub_metering_1)
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)
x$Sub_metering_2<- as.character(x$Sub_metering_2)
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)
x$Sub_metering_3 <- as.character(x$Sub_metering_3)
x$Sub_metering_3<- as.numeric(x$Sub_metering_3)
#check data looks ok
#head(x)
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#windows()
png(filename = 'plot4.png', width = 480, height = 480, units = 'px')


##PLOT 1
##plot chart for question 1
par(mfrow=c(2,2))
par(mar=c(4,2,1,4))
##hist(x$Global_active_power,xlab= "Global Active Power (kilowatts)",main="Global Active Power",col="red")
##PLOT1 ##R1C1
plot( x$DateTime,x$Global_active_power,xlab="",ylab ="Global Active Power",type="l")
##PLOT 2#R1C2
plot(x$DateTime,x$Voltage,xlab="datetime",ylab="Voltage",type ="l")
##PLOT 3#R2C1
plot(x$DateTime,x$Sub_metering_1,type="l",col="black",xlab="",ylab ="Energy Sub Metering")
lines(x$DateTime,x$Sub_metering_2,col="red")
lines(x$DateTime,x$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch= "-", col=c("black", col="red", col="blue"),cex = 0.6)
##PLOT 4#2C2
plot( x$DateTime,x$Global_reactive_power,xlab="datetime",ylab ="Global_reactive_ower",type="l")

dev.off()
