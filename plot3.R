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

plot3 <- ggplot(hpc) + 
  geom_line(aes(date_time, Sub_metering_1)) + 
  geom_line(aes(date_time, Sub_metering_2), color = "red") + 
  geom_line(aes(date_time, Sub_metering_3), color = "blue") + 
  ylab("Energy sub metering")
plot3
ggsave("plot3.png", plot = plot3, width = 4.8, height = 4.8, dpi=100)