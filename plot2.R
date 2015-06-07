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

# export Plot 2
plot2()
dev.copy(png,"~/course-work/C4/plot2.png", width=480, height=480)
dev.off()
