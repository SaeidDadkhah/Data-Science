# Read and clean data
data <- read.csv2('companydata.csv', sep = ',')
col <- c('y', 'x1', 'x2', 'x3')
data[, col] <- apply(data[, col], 2, function(x) as.numeric(x))

#Train models and check them
l0 <- lm(y ~ 1, data)
l1 <- lm(y ~ x1, data)
l2 <- lm(y ~ x1 + x2, data)
l3 <- lm(y ~ x1 + x2 + x3, data)

print(anova(l0, l1, l2, l3))
