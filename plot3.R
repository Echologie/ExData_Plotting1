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
png(file="plot3.png")
with(elec, {
  plot( Time,
        Sub_metering_1,
        col  = "black",
        xlab = "",
        ylab = "Energy sub metering",
        type = "n" )
  lines( Time, Sub_metering_1, col = "black" )
  lines( Time, Sub_metering_2, col = "red"   )
  lines( Time, Sub_metering_3, col = "blue"  ) })
legend( "topright",
        pch = "_",
        col = c("black","red","blue"),
        legend = c( "Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_metering_3" ) )
dev.off()