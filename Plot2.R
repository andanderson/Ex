

Sys.setlocale("LC_ALL",locale = "English")


setwd("C:/Users/Andanderson/Documents/Coursera/Exploratory/exdata-data-household_power_consumption")
power <- read.table("household_power_consumption.txt",
                    header = TRUE, sep =";", na.strings = "?", stringsAsFactors = FALSE)

head(power)

DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")


power$Date <- DateTime


power$Data<- as.Date(power$Date)


power <- power[power$Data  > "2007-01-31" & power$Data < "2007-02-03",]

png(filename = "Plots/Plot2.png")
with(power, plot(Date,Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = ""))
dev.off()