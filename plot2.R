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
## Plot 2
plot(y=df1$Global_active_power, x= df1$Date1,type="l",ylab = "Global Active Power (kilowatts)",xlab = "")

png(filename="plot2.png",width = 480, height = 480,units = "px")
plot(y=df1$Global_active_power, x= df1$Date1,type="l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()