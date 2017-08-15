library(data.table)
dt<-fread("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
#converting first column to date type
dt[,1]<-dt[,lapply(.SD,strptime,format = "%d/%m/%Y"), .SDcols=c("Date")]
#subsetting required data
dt2<-dt[(dateVector$Date>= as.POSIXlt("2007-02-01"))&(dateVector$Date<= as.POSIXlt("2007-02-02")),]

#getting positions of labels
friday<-match(as.POSIXct("2007-02-02"), dt2$Date)
numrows<-nrow(dt2)

plot(dt2$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering",xaxt="n")
lines(dt2$Sub_metering_2, col="red", type="l")
lines(dt2$Sub_metering_3, col="blue", type="l")
axis(1, at=c(1,friday,numrows), labels=c("Thu", "Fri", "Sat"))
legend("topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)

dev.copy(png, file = "plot3.png",height = 480, width = 480)
dev.off()