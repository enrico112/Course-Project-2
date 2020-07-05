library(dplyr)
library(ggplot2)

vehicle_sources <- SCC %>% filter(grepl("vehicle", paste(SCC.Level.One, SCC.Level.Two, SCC.Level.Three, SCC.Level.Four, sep = "-"), ignore.case = TRUE)) 
sum_data <- NEI %>% filter(SCC %in% vehicle_sources$SCC & fips=="24510") %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

# Open PNG device
png("Plots/plot5.png", width = 480, height = 480)

# Plotting
ggplot(sum_data, aes(y = Emissions, x= year)) + 
    geom_line() +
    labs(x = "Year", y = "Emissions (Ton)", title = "PM2.5 vehicle emissions in Baltimore City [1999-2008]") +
    scale_x_continuous(breaks = seq(1999, 2008, 3))

dev.off()
