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
# Plot 4
#

png("plot4.png",  width = 480, height = 480)

par(mfcol=c(2,2))


with(dfPower, if (TRUE) {
  plot(DateTime, Global_active_power,
       type="l",
       ylab="Global Active Power (kilowatts)"
  )
}
)

  
with(dfPower, if (TRUE) {
  plot(DateTime, Sub_metering_1,
       type="l",
       ylab="Energy sub metering",
       xlab=""
  )
  lines(DateTime, Sub_metering_2,
        col="red"
  )
  lines(DateTime, Sub_metering_3,
        col="blue"
  )
  legend("topright", 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c(par("fg"), "red", "blue"),
         lty=1, bty = "n"
  )
})

with(dfPower, if (TRUE) {
  plot(DateTime, Voltage,
       type="l",
       xlab="datetime"
  )
})

with(dfPower, if (TRUE) {
  plot(DateTime, Global_reactive_power,
       type="l",
       xlab="datetime"
  )
})

dev.off()



