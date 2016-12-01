# Make a plot that answers the question:
#   what is the relationship between mean covered charges (Average.Covered.Charges) and
#   mean total payments (Average.Total.Payments) in New York? 

# Load ggplot library
library(ggplot2)

# Read data
payments <- read.csv("payments.csv", header = TRUE)

# Subset data related to NY
nyPayments <- subset(payments, Provider.State == 'NY')

plot <- ggplot(nyPayments, aes(log10(Average.Covered.Charges), log10(Average.Total.Payments))) +
    geom_point(alpha = 0.5, shape = 19, color = "green4") +
    geom_smooth(method = "lm", color = "brown") +
    labs(title = "Covered Charges vs. Total Payments in New York") +
    labs(x = "Covered Charges", y = "Total Payments")

pdf("Plot1.pdf")
print(plot)
dev.off()
