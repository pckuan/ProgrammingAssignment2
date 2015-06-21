## The programming itself is pretty straightforward, I just change come terms in the code.
## Actually it is harder to totally understand how the overall code works.

## This function just a list of functions which hold values of the matrix and the related inverse, if assigned

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(Inv) i <<- Inv
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function solve the inverse matrix for a given matrix

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if(!is.null(i)) {
            message("getting cached data")
            return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
