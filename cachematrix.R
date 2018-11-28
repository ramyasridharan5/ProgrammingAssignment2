## Below functions are an example of how Lexical Scoping can be
## done in R with matrix inverse as an example

## makeCacheMatrix is a function that is used to set and get
##the value of a matrix and also to get and set the inverse of the
##matrix

makeCacheMatrix <- function(x = matrix()) {
    mat_in<-NULL
    set <- function(y){
        x<<-y
        mat_in <<-NULL
    }
    get <-function()x
    setm <- function(matinv) mat_in <<- matinv
    getm <- function() mat_in
    list(set = set, get=get, setm = setm, getm = getm)
}


## cacheSolve is a function that takes another function
# as argument and returns a matrix that inverse. If the
## value is already available in cache, it will print from cache.
## if notm, it will compute the inverse and save it to cache
## and print it

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    mat_in <-x$getm()
    if(!is.null(m)){
        message("getting cached value")
        return(mat_in)
    }
    data <- x$get()
    m <- solve(x,...)
    x$setm(mat_in)
    m
}
