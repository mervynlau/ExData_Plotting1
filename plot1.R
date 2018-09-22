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

# Plot 1

with(hpc,
     hist(Global_active_power, col = "red", xlab = "Global Avtive Power (kilowatts)", main = "Global Active Power"))

dev.copy(png,'plot1.png')
dev.off()

