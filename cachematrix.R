# makeCahcheMatrix function - Creates a matrix where the matrix 
# will cache the inverse

makeCacheMatrix <- function(x = matrix()){
      invMatrix <- NULL
      set <- function(y) {
            x <<- y 
            invMatrix <<- NULL
      }
      
      get <- function() x
      setInverse <- function(inverse) invMatrix <<- inverse
      getInverse <- function() invMatrix
      list(set = set, 
           get = get,
           setInverse = setInverse,
           getInverse = getInverse)
}


# cacheSolve function - Computes the inverse of the cached matrix from the 
# function makeCacheMatrix

cacheSolve <- function(x, ...) {
      invMatrix <- x$getInverse()
      if(!is.null(invMatrix)) {
            message("getting cached data")
            return(invMatrix)
      }
      data <- x$get()
      invMatrix <- solve(data, ...)
      x$setInverse(invMatrix)
      invMatrix
}

