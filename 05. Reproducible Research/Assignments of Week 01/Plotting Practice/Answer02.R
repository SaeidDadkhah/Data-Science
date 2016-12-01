# Make a plot (possibly multi-panel) that answers the question:
# how does the relationship between mean covered charges (Average.Covered.Charges) and
# mean total payments (Average.Total.Payments) vary by medical condition (DRG.Definition)
# and the state in which care was received (Provider.State)?

# Load ggplot library
library(ggplot2)

# Read data
payments <- read.csv("payments.csv", header = TRUE)

levels(payments$DRG.Definition) <- c("194", "292", "392", "641", "690", "871")

plot <- ggplot(payments, aes(log10(Average.Covered.Charges), log10(Average.Total.Payments))) +
    geom_point(alpha = 0.1, color = "green4") +
    geom_smooth(method = "lm", color = "brown", size = 0.7) +
    facet_grid(DRG.Definition ~ Provider.State) +
    labs(title = "Covered Charges vs. Total Payments by Provider State and Medical Condition") +
    labs(x = "Covered Charges", y = "Total Payments")

pdf("Plot2.pdf")
print(plot)
dev.off()
