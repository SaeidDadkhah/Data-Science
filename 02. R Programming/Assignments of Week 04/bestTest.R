print("Check best function existence...")
if (!exists("best", mode = "function")) {
    print("Sourcing best.R file!")
    source("best.R")
}

print("Start testing best.R")
print(best("TX", "heart attack"))
# Answer: CYPRESS FAIRBANKS MEDICAL CENTER

print(best("TX", "heart failure"))
# Answer: FORT DUNCAN MEDICAL CENTER

print(best("MD", "heart attack"))
# Answer: JOHNS HOPKINS HOSPITAL, THE

print(best("MD", "pneumonia"))
# Answer: GREATER BALTIMORE MEDICAL CENTER

best("BB", "heart attack")
# Answer: Error in best("BB", "heart attack") : invalid state

best("NY", "hert attack")
# Answer: Error in best("NY", "hert attack") : invalid outcome

