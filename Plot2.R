mydata <-read.table("./household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE, dec=".")
mydata <-mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]
png("plot2.png", width=480, height=480)
mydata$datetime <- strptime(paste(mydata$Date,mydata$Time,sep=""),"%d/%m/%Y %H:%M:%S")
plot(mydata$datetime,as.numeric(mydata$Global_active_power), type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()