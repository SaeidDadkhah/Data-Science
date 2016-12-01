print("Check rankHospital function existence...")
if (!exists("rankHospital", mode = "function")) {
    print("Sourcing rankHospital.R file!")
    source("rankHospital.R")
}

print("Start testing rankHospital.R")
print(rankHospital("TX", "heart failure", 4))
# Answer: "DETAR HOSPITAL NAVARRO"

print(rankHospital("MD", "heart attack", "worst"))
# Answer: "HARFORD MEMORIAL HOSPITAL"

print(rankHospital("MN", "heart attack", 5000))
# Answer: NA
