library(dplyr)
library(ggplot2)

coal_comb_sources <- SCC %>% filter(grepl("coal", SCC.Level.Four, ignore.case = TRUE) & grepl("combustion", SCC.Level.One, ignore.case = TRUE)) 
sum_data <- NEI %>% filter(SCC %in% coal_comb_sources$SCC) %>% 
    group_by(year) %>% 
    summarise(Emissions = sum(Emissions))

# Open PNG device
png("Plots/plot4.png", width = 480, height = 480)

# Plotting
ggplot(sum_data, aes(y = Emissions, x= year)) + 
    geom_line() +
    labs(x = "Year", y = "Emissions (Ton)", title = "PM2.5 coal combustion related source emissions across US [1999-2008]") +
    scale_x_continuous(breaks = seq(1999, 2008, 3))

dev.off()
