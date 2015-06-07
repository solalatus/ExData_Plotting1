library(sqldf)
# Needed for selective load from file based on SQL filter

# To get date and time according to exaples, and not my locale
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8")


# Read data
filename <- "~/course-work/C4/household_power_consumption.txt"
dat <-read.csv.sql(filename, sql='select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep=";", header=T)

# Plot 2
plot2 <- function(){
    with(dat, plot(strptime(paste(Date,Time),format="%d/%m/%Y%H:%M"),Global_active_power,type="n",xlab="", ylab="Global Active Power (kilowatts)"))
    with(dat, lines(strptime(paste(Date,Time),format="%d/%m/%Y%H:%M"),Global_active_power,type="l"))
}
  
# Plot 3
plot3 <-function(){
    with(dat, plot(strptime(paste(Date,Time),format="%d/%m/%Y%H:%M"),Sub_metering_1,type="n",xlab="", ylab="Energy sub metering"))
    with(dat, lines(strptime(paste(Date,Time),format="%d/%m/%Y%H:%M"),Sub_metering_1,type="l"))
    with(dat, lines(strptime(paste(Date,Time),format="%d/%m/%Y%H:%M"),Sub_metering_2,type="l", col="red"))
    with(dat, lines(strptime(paste(Date,Time),format="%d/%m/%Y%H:%M"),Sub_metering_3,type="l", col="blue"))
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col= c("black","red","blue"))
}

# voltage plot
plotVoltage <-function(){
  with(dat, plot(strptime(paste(Date,Time),format="%d/%m/%Y%H:%M"),Voltage,type="n",xlab="datetime", ylab="Voltage"))
  with(dat, lines(strptime(paste(Date,Time),format="%d/%m/%Y%H:%M"),Voltage,type="l"))
  
}

# reactive plot
plotReactive <-function(){
  with(dat, plot(strptime(paste(Date,Time),format="%d/%m/%Y%H:%M"),Global_reactive_power,type="n",xlab="datetime", ylab="Global_reactive_power"))
  with(dat, lines(strptime(paste(Date,Time),format="%d/%m/%Y%H:%M"),Global_reactive_power,type="l"))
  
}


# Plot 4
plot4 <-function(){
    par(mfrow=c(2,2))
    plot2()
    plotVoltage()
    plot3()
    plotReactive()
}

# export Plot 4
plot4()
dev.copy(png,"~/course-work/C4/plot4.png", width=480, height=480)
dev.off()
