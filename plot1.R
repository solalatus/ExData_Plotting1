library(sqldf)
# Needed for selective load from file based on SQL filter

# To get date and time according to exaples, and not my locale
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8")


# Read data
filename <- "~/course-work/C4/household_power_consumption.txt"
dat <-read.csv.sql(filename, sql='select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep=";", header=T)

# Plot 1
plot1 <- function(){
    with(dat, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global active power"))
}

# export Plot 1
par(mfrow=c(1,1))
plot1()
dev.copy(png,"~/course-work/C4/plot1.png", width=480, height=480)
dev.off()
