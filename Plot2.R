library(dplyr)

sum_data <- NEI %>% filter(fips=="24510") %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

# Open PNG device
png("Plots/plot2.png", width = 480, height = 480)

# Plotting
with(sum_data,barplot(Emissions, names.arg = year, xlab = "Year", ylab = "Emissions (Ton)", main = "PM2.5 emissions in Baltimore City [1999-2008]"))

dev.off()
