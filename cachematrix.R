## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix initializes the provided matrix as an R object and caches it
## the inverse of the matrix is initilaised as NULL

makeCacheMatrix <- function(x = matrix()) {
	y <- NULL
	set <- function(a){
		x <<- a
		y <<- NULL
	}
	get <- function() x
      setIinverse <- function(Iinverse) y <<- Iinverse
      getIinverse <- function() y
      list(set = set, get = get, setIinverse = setIinverse, getIinverse = getIinverse)
}


## cacheSolve checks the cache for the inverse of the Matrix. 
## if it was earlier solved then it returns that inverse matrix
## else it calculates the inverse and caches it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the Iinverse of 'x'
	y <- x$getIinverse()
	if(!is.null(y)){
		print("Getting Cached Inverse: ")
		y
		return(y)
	}
	print("Caching Inverse!")
	temp <- x$get()
	y <- solve(temp)
	x$setIinverse(y)
	y
}
