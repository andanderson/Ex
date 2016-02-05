


setwd("C:/Users/Andanderson/Documents/Coursera/Exploratory/exdata-data-household_power_consumption")
power <- read.table("household_power_consumption.txt",
                    header = TRUE, sep =";", na.strings = "?", stringsAsFactors = FALSE)

head(power)

DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")


power$Date <- DateTime


power$Data<- as.Date(power$Date)


power <- power[power$Data  > "2007-01-31" & power$Data < "2007-02-03",]


png(filename = "Plots/Plot.4.png")
par(mfrow = c(2,2))

with(power, {
        plot(Date,Global_active_power,
                 type = "l",
                 ylab = "Global Active Power",
                 xlab = "")
        plot(Date,Voltage,
             type = "l",
             ylab = "Voltage",
             xlab = "datetime")
        plot(Date,Sub_metering_1, type = "n",ylab = "Energy sub metering",
             xlab = "")
        lines(Date,Sub_metering_1, col = "black")
        lines(Date,Sub_metering_2, col = "red")
        lines(Date,Sub_metering_3, col = "blue")
        legend("topright", pch = "__", 
               legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
               cex = .7,
               pt.cex = 1,
               col = c("black","red","blue"))
        plot(Date,Global_reactive_power,
             type = "l",
             xlab = "datetime")
        })
dev.off()