library(readr)
library(tidyverse)
library(lubridate)
hpc <- read_delim("household_power_consumption.txt", 
                  ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                               Time = col_time(format = "%H:%M:%S")), 
                  trim_ws = TRUE)
hpc <- filter(hpc, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02")) %>% mutate(date_time = paste(Date, Time))
hpc <- mutate(hpc, date_time = ymd_hms(date_time))            
hpc


# Plot 3

with(hpc,
     plot(date_time, Sub_metering_1, type="l", ylab="Energy sub metering"))
with(hpc,
     lines(date_time, Sub_metering_2, col = "blue"))
with(hpc,
     lines(date_time, Sub_metering_3, col = "red"))
legend("topright", lty = 1 , col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,'plot3.png')
dev.off()

