print("Check rankAll function existence...")
if (!exists("rankAll", mode = "function")) {
    print("Sourcing rankAll.R file!")
    source("rankAll.R")
}

print("Start testing rankAll.R")
print(head(rankAll("heart attack", 20), 10))
# Answer:      hospital state
#      AK <NA> AK
#      AL D W MCMILLAN MEMORIAL HOSPITAL AL
#      AR ARKANSAS METHODIST MEDICAL CENTER AR
#      AZ JOHN C LINCOLN DEER VALLEY HOSPITAL AZ
#      CA SHERMAN OAKS HOSPITAL CA
#      CO SKY RIDGE MEDICAL CENTER CO
#      CT MIDSTATE MEDICAL CENTER CT
#      DC <NA> DC
#      DE <NA> DE
#      FL SOUTH FLORIDA BAPTIST HOSPITAL FL

print(tail(rankAll("pneumonia", "worst"), 3))
# Answer:       hospital state
#      WI MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC WI
#      WV PLATEAU MEDICAL CENTER WV
#      WY NORTH BIG HORN HOSPITAL DISTRICT WY

print(tail(rankAll("heart failure"), 10))
# Answer:       hospital state
#      TN WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL TN
#      TX FORT DUNCAN MEDICAL CENTER TX
#      UT VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER UT
#      VA SENTARA POTOMAC HOSPITAL VA
#      VI GOV JUAN F LUIS HOSPITAL & MEDICAL CTR VI
#      VT SPRINGFIELD HOSPITAL VT
#      WA HARBORVIEW MEDICAL CENTER WA
#      WI AURORA ST LUKES MEDICAL CENTER WI
#      WV FAIRMONT GENERAL HOSPITAL WV
#      WY CHEYENNE VA MEDICAL CENTER WY
