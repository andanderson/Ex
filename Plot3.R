


setwd("C:/Users/Andanderson/Documents/Coursera/Exploratory/exdata-data-household_power_consumption")
power <- read.table("household_power_consumption.txt",
                    header = TRUE, sep =";", na.strings = "?", stringsAsFactors = FALSE)

head(power)

DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")


power$Date <- DateTime


power$Data<- as.Date(power$Date)


power <- power[power$Data  > "2007-01-31" & power$Data < "2007-02-03",]


png(filename = "Plots/Plot3.png")
with(power,{
        plot(Date,Sub_metering_1, type = "n",ylab = "Energy sub metering",
             xlab = "")
        lines(Date,Sub_metering_1, col = "black")
        lines(Date,Sub_metering_2, col = "red")
        lines(Date,Sub_metering_3, col = "blue")
        legend("topright", pch = "__", 
               legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
               col = c("black","red","blue"))
})
dev.off()
