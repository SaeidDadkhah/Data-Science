if (!exists("makeCacheMatrix", mode = "function")) {
    print("Sourcing cachematrix.R file!")
    source("cachematrix.R")
}

print("checking cachematrix.R")

mat <- matrix(rnorm(9), nrow = 3, ncol = 3)
cachedMatrix <- makeCacheMatrix(mat)
cacheSolve(cachedMatrix)
cacheSolve(cachedMatrix)
