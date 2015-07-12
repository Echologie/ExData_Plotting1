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
png(file="plot2.png")
with(elec, {
  plot( Time,
        Global_active_power,
        col  = "black",
        xlab = "",
        ylab = "Global Active Power (kilowatts)",
        type = "n" )
  lines(Time, Global_active_power) })
dev.off()