
library(dplyr)
library(ggplot2)

vehicle_sources <- SCC %>% filter(grepl("vehicle", paste(SCC.Level.One, SCC.Level.Two, SCC.Level.Three, SCC.Level.Four, sep = "-"), ignore.case = TRUE)) 
sum_data <- NEI %>% filter(SCC %in% vehicle_sources$SCC & fips %in% c("24510","06037")) %>% group_by(fips,year) %>% summarise(Emissions = sum(Emissions))

# Open PNG device
png("Plots/plot6.png", width = 480, height = 480)

# Plotting
ggplot(sum_data, aes(y = Emissions, x= year, color = fips)) + 
    geom_line() +
    labs(x = "Year", y = "Emissions (Ton)", title = "PM2.5 vehicle emissions in Baltimore City and Los Angeles [1999-2008]", color ="County") +
    scale_x_continuous(breaks = seq(1999, 2008, 3)) +
    scale_color_manual(labels = c("Los Angeles", "Baltimore"), values = c("24510","06037"))

dev.off()
