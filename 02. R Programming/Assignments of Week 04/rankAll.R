rankAll <- function(outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that outcome is valid
    columns <- names(data)
    if (identical(outcome, "heart attack")) {
        columns <- columns[c(2, 7, 11)]
    } else if (identical(outcome, "heart failure")) {
        columns <- columns[c(2, 7, 17)]
    } else if (identical(outcome, "pneumonia")) {
        columns <- columns[c(2, 7, 23)]
    } else {
        stop("invalid outcome")
    }
    
    ## Preprocess data
    usableData <- data
    suppressWarnings(
        usableData[, columns[3]] <- as.numeric(usableData[, columns[3]]))
    ### Handle warning
    usableData <- usableData[!is.na(usableData[columns[3]]), columns]
    
    ## For each state, find the hospital of the given rank
    splitted <- split(usableData, usableData$State)
    usableData <- lapply(splitted, function(curData) {
        ### Check if num is valid rank
        if (num == "best") {
            num = 1
        } else if (num == "worst") {
            num = nrow(curData)
        } else if (num > nrow(curData)) {
            return(NA)
        }
        
        ### Rank hospitals
        curData <- curData[order(curData[, 3], curData[, 1]), ]
        
        curData[num, c(1, 2)]
    })
    
    ## Return a data frame with the hospital names and the (abbreviated) state name
    usableData
}
