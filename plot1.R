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
plot1 <- ggplot(hpc, aes(Global_active_power)) + geom_histogram(color = "black", fill = "red") + 
  xlab("Global Avtive Power (kilowatts)") + ylab("Frequency") + ggtitle("Global Active Power") 
plot1
ggsave("plot1.png", plot = plot1, width = 4.8, height = 4.8, dpi=100)