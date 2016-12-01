best <- function(state, outcome) {
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
    suppressWarnings(usableData[, columns[2]] <- as.numeric(usableData[, columns[2]]))
    usableData <- usableData[!is.na(usableData[columns[2]]), columns]
    
    ## Select best hospital
    usableData <- usableData[min(usableData[, columns[2]]) == usableData[columns[2]], columns[1]]
    
    ## Select the first hospital alphabetically
    usableData <- usableData[min(usableData) == usableData]
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    usableData
}
