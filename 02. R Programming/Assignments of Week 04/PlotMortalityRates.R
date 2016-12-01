# read data from "outcome-of-care-measures.csv"
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# coerce column 11 from character to numeric
outcome[, 11] <- as.numeric(outcome[, 11])

# plot histogram of mortality rates
hist(outcome[, 11])
