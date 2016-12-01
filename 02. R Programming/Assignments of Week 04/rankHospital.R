rankHospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    if (!is.element(state, data$State)) {
        stop("invalid state")
    }
    
    columns <- names(data)
    if (identical(outcome, "heart attack")) {
        columns <- columns[c(2, 11)]
    } else if (identical(outcome, "heart failure")) {
        columns <- columns[c(2, 17)]
    } else if (identical(outcome, "pneumonia")) {
        columns <- columns[c(2, 23)]
    } else {
        stop("invalid outcome")
    }
    
    ## Preprocess data
    usableData <- data[data$State == state, ]
    suppressWarnings(
        usableData[, columns[2]] <- as.numeric(usableData[, columns[2]]))
    ### Handle warning
    usableData <- usableData[!is.na(usableData[columns[2]]), columns]
    
    ## Check if num is a valid rank
    if (num == "best") {
        num = 1
    } else if (num == "worst") {
        num = nrow(usableData)
    } else if (num > nrow(usableData)) {
        return(NA)
    }
    usableData <- usableData[order(usableData[, columns[2]], usableData[, columns[1]]), ]
    
    ## Return hospital name in that state with the given rank 30-day death rate
    usableData[num, columns[1]]
}
