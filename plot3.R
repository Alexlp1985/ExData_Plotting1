library(lubridate)
require(lubridate)
temp <- tempfile()
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,temp,method = "curl")
temp1<-tempdir()
unzip(zipfile = temp,exdir = temp1)
df<-read.table(paste(temp1,"/household_power_consumption.txt",sep=""),sep = ";",dec = ".",header = TRUE,na.strings = "?")
df$Date1<-dmy_hms(paste(df$Date,df$Time,sep = " "))
df1<-subset(df,Date1 %within% interval(ymd("2007-02-01"),ymd("2007-02-03")))
## Plot 3
plot(x= df1$Date1,y=df1$Sub_metering_1,type ="l",ylab = "Energy sub metering", xlab = "")
lines(x=df1$Date1,y=df1$Sub_metering_2,col="red")
lines(x=df1$Date1,y=df1$Sub_metering_3,col="blue")
legend("topright","(x,y)",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty = 1,cex=0.5, y.intersp = 0.5,x.intersp = 0.15)

## PNG file

png(filename="plot3.png",width = 480, height = 480,units = "px")
plot(x= df1$Date1,y=df1$Sub_metering_1,type ="l",ylab = "Energy sub metering", xlab = "")
lines(x=df1$Date1,y=df1$Sub_metering_2,col="red")
lines(x=df1$Date1,y=df1$Sub_metering_3,col="blue")
legend("topright","(x,y)",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty = 1,cex=0.5, y.intersp = 0.5,x.intersp = 0.15)
dev.off()