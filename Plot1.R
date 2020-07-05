library(dplyr)

sum_data <- NEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

# Open PNG device
png("Plots/plot1.png", width = 480, height = 480)

# Plotting
with(sum_data,barplot(Emissions, names.arg = year, xlab = "Year", ylab = "Emissions (Ton)", main = "PM2.5 emissions in US [1999-2008]"))

dev.off()
