print("Checking if pollutant is imported!")
if (!exists("pollutantmean", mode = "function")) {
  source("pollutantmean.R")
}

print("Starting Checking of pollutantmean on whole data.")
allSulfate <- pollutantmean("specdata", "sulfate")
allNitrate <- pollutantmean("specdata", "nitrate")

print(allSulfate)
print(allNitrate)

# print(pollutantmean("specdata", "nitrate", 275))
