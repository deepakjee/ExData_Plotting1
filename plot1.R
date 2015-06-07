load_data<-function() {
        data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2880)
        names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")
        data$Time<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
        data$Date<-as.Date(data$Date,"%d/%m/%Y")     
}

plot1<-function(){
        
        if(is.null(data))
                data <- load_data()
        
        png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
        hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
        dev.off()
}