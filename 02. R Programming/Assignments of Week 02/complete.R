complete <- function(directory, id = 1:332) {
    res <- data.frame(id = numeric(), nobs = numeric())
    for (curId in id) {
        read_data <- read.csv(paste0(directory, sprintf("/%03d.csv", curId)))
        res <- rbind(res,
                     data.frame(id = curId,
                                nobs = dim(read_data[complete.cases(read_data),])[1]))
    }
    res
}

print(complete("specdata", 1))
## Answer:
##   id nobs
## 1  1  117

print(complete("specdata", c(2, 4, 8, 10, 12)))
## Answer:##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96

print(complete("specdata", 30:25))
## Answer:
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463

print(complete("specdata", 3))
## Answer:
##   id nobs
## 1  3  243
