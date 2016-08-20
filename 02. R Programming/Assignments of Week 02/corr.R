corr <- function(directory, threshold = 0) {
    res <- vector()
    files <- dir(directory)
    for (curFile in files) {
        read_data <- read.csv(paste0("specdata", sprintf("/%s", curFile)))
        # print(read_data[200:250, ])
        available_data <- read_data[complete.cases(read_data), ]
        # print(available_data[1:10, ])
        if (dim(available_data)[1] > threshold) {
            res <- c(res, cor(x = available_data["sulfate"], y = available_data["nitrate"]))
        }
    }
    
    res
}


cr <- corr("specdata", 150)
print(head(cr))
## Answer:
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
print(summary(cr))
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630

cr <- corr("specdata", 400)
print(head(cr))
## Answer:
## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
print(summary(cr))
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630

cr <- corr("specdata", 5000)
print(summary(cr))
## Answer:
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
print(length(cr))
## [1] 0

cr <- corr("specdata")
print(summary(cr))
## Answer:
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
print(length(cr))
## [1] 323
