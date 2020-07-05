library(dplyr)
library(ggplot2)

sum_data <- NEI %>% filter(fips=="24510") %>% group_by(type,year) %>% summarise(Emissions = sum(Emissions))

# Open PNG device
png("Plots/plot3.png", width = 480, height = 480)

# Plotting
ggplot(sum_data, aes(colour = type, x = year, y = Emissions)) + 
    geom_line() +
    labs(x = "Year", y = "Emissions (Ton)", title = "PM2.5 emissions in Baltimore City [1999-2008]") +
    scale_x_continuous(breaks = seq(1999, 2008, 3))

dev.off()
