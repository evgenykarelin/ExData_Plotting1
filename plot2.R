library(data.table)
dt<-fread("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
#converting first column to date type
dt[,1]<-dt[,lapply(.SD,strptime,format = "%d/%m/%Y"), .SDcols=c("Date")]
#subsetting required data
dt2<-dt[(dateVector$Date>= as.POSIXlt("2007-02-01"))&(dateVector$Date<= as.POSIXlt("2007-02-02")),]

#getting positions of labels
friday<-match(as.POSIXct("2007-02-02"), dt2$Date)
numrows<-nrow(dt2)

plot(dt2$Global_active_power, type="l", xlab="", ylab = "Global Avtive Power (kilowatts)",xaxt="n")
axis(1, at=c(1,friday,numrows), labels=c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot2.png",height = 480, width = 480)
dev.off()