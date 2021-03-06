## Two different functions 
## makeCacheMatrix receives matrix as an input, returns a list of 4 functions

## cacheSolve receives a list generated by makeCacheMatrix. If global inverse is already calculated it simply fetches the value. If not it calculates the inverse, sets the global variable.  

## This fn gets a matrix and returns a list of functions
makeCacheMatrix <- function( x = matrix() ) 
{
  
  invmat <- NULL
  
  set <- function(y) 
    {
    x <<- y
    invmat <<- NULL
    }
  
  get <- function()
    {
    x
    }
  
  setinv <- function(inv) 
    {
    message ("Setting the inverse through makeChacheMatrix function")
    invmat <<- inv 
    }

    getinv <- function() 
      {
      invmat
      }
  
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) 
{
        ## Return a matrix that is the inverse of 'x'
  invmat <- x$getinv()
  
  if(!is.null(invmat)) 
    {
    message("Retreiving cached inverse of matrix")
    return(invmat)
    }
  data <- x$get()
  message ("Displaying original matrix")
  print (data)
  invmat <- solve(data, ...)
  x$setinv(invmat)
  invmat
}

