## The two functions are used to collectively create a special object that stores a matrix and cache's its inverse
## 

## The first function creates a list that sets and gets the value of the matrix as well as its inverse. 

makeCacheMatrix <- function(x = matrix()) {

        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmatrix <- function(solve) m <<- solve
        getmatrix <- function() m
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}


## This function calculates the inverse - it checks whether the inverse is already calculated, in which case it gets it from the cache and if not, the inverse is calculated.

cacheSolve <- function(x=matrix(), ...) {
         m <- x$getmatrix()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$setmatrix(m)
        m       ## Return a matrix that is the inverse of 'x'
}
