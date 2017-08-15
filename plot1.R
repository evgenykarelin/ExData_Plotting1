library(data.table)
dt<-fread("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
#converting first column to date type
dt[,1]<-dt[,lapply(.SD,strptime,format = "%d/%m/%Y"), .SDcols=c("Date")]
#subsetting required data
dt2<-dt[(dateVector$Date>= as.POSIXlt("2007-02-01"))&(dateVector$Date<= as.POSIXlt("2007-02-02")),]

hist(dt2$Global_active_power, col="red", main="Global Active Power", xlab = "Global Avtive Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()