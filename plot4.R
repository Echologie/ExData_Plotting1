elec <- read.table(
  "household_power_consumption.txt",
  sep = ";",
  na.strings = "?",
  header = TRUE,
  colClasses = c( "character", "character", "numeric",
                  "numeric",   "numeric",   "numeric",
                  "numeric",   "numeric",   "numeric" ) )
elec <- elec[elec$Date == "1/2/2007" | elec$Date == "2/2/2007", ]
elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")
elec$Time <- strptime( paste(elec$Date, elec$Time),
                       "%Y-%m-%d %H:%M:%S" )
png(file="plot4.png")
par(mfrow = c(2,2))
with( elec, {

  plot( Time,
        Global_active_power,
        col  = "black",
        xlab = "",
        ylab = "Global Active Power",
        type = "n" )
  lines(Time, Global_active_power)

  plot( Time,
        Voltage,
        col  = "black",
        xlab = "datetime",
        ylab = "Voltage",
        type = "n" )
  lines(Time, Voltage)

  plot( Time,
        Sub_metering_1,
        col  = "black",
        xlab = "",
        ylab = "Energy sub metering",
        type = "n" )
  lines( Time, Sub_metering_1, col = "black" )
  lines( Time, Sub_metering_2, col = "red"   )
  lines( Time, Sub_metering_3, col = "blue"  )

  plot( Time,
        Global_reactive_power,
        col  = "black",
        xlab = "datetime",
        ylab = "Global_reactive_power",
        type = "n" )
  lines(Time, Global_reactive_power) })
dev.off()