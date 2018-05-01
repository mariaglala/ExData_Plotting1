mydata <-read.table("./household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE, dec=".")
mydata <-mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]
png("plot3.png", width=480, height=480)
mydata$datetime <- strptime(paste(mydata$Date,mydata$Time,sep=""),"%d/%m/%Y %H:%M:%S")
plot(mydata$datetime,as.numeric(mydata$Sub_metering_1), type="l",xlab="", ylab="Energy submetering")
lines(mydata$datetime,as.numeric(mydata$Sub_metering_2), type="l", col="red")
lines(mydata$datetime,as.numeric(mydata$Sub_metering_3), type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()