#
# power-charts.R (plot1.R,plot2.R,plot3.R,plot4.R)
#
#

library(lubridate)

dfPower <- read.table("household_power_consumption.txt", 
                      stringsAsFactors = FALSE,
                      header=TRUE, sep=";", na.strings = "?")

dfPower$DateTime <- strptime(paste(dfPower$Date, dfPower$Time), "%d/%m/%Y %H:%M:%S")
dfPower$Date <- as.Date(dfPower$DateTime)

dfPower <- tbl_df(dfPower)

# Remember: Time is stil string

#
# Plot 1
#

png("plot1.png",  width = 480, height = 480)
with(dfPower, 
     hist(Global_active_power, 
          col="red",
          main="Global Active Power", 
          xlab="Global Active Power (kilowatts)"
          )
     )

dev.off()




