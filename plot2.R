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

with(hpc,
 plot(date_time, Global_active_power, type="l", ylab = "Global Avtive Power (kilowatts)")
)

dev.copy(png,'plot2.png')
dev.off()


