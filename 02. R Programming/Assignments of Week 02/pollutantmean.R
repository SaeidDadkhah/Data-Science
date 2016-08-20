pollutantmean <- function(directory, pollutant, id = 1:332) {
  sigma <- 0
  num <- 0
  for (curId in id) {
    # print(curId)
    name <- paste0(directory, sprintf("/%03d.csv", curId))
    #print(name)
    read_data <- read.csv(name)
    #available_data <- read_data[complete.cases(read_data), ]
    #print(class(a[0]))
    newData <- sum(!is.na(read_data[, pollutant]))
    num <- num + newData
    #print(num)
    if (newData > 0)
      sigma <- sigma + sum(read_data[pollutant], na.rm = TRUE)
    #print(sigma)
  }
  
  # mean of numbers
  sigma / num
}

print(pollutantmean("specdata", "sulfate", 1:10))
# Answer: 4.064

print(pollutantmean("specdata", "nitrate", 70:72))
# Answer: 1.706

print(pollutantmean("specdata", "nitrate", 23))
# Answer: 1.281
