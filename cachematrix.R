## Hi, the following fucntions create a matrix, inverse it and store it in cache for timely processing

## MakeCacheMatrix is a function that returns a list of cached functions
makeCacheMatrix<-function(x=matrix()) {
        inverse<-NULL
        choose<-function(y) {
        x<<-y
        inverse<<-NULL
        }
        get<-function()x
        chooseinverse<-function(inverse)inverse<<- inverse
        getinverse<-function()inverse
        list(choose=choose,get=get, 
        chooseinverse=chooseinverse,getinverse=getinverse)
}

## Calculates the inverse of the matrix returned by the previous function and retrieves it from cache

cacheSolve<-function(x, ...){
        inverse<-x$getinverse()
        if(!is.null(inverse)){
                return(inverse)
                }
        matrix.data<-x$get()
        inverse<-solve(matrix.data, ...)
        x$chooseinverse(inverse)
        inverse
        }
        
## You can use the following code to test my code.
mymatrix<-makeCacheMatrix(matrix(1:4, 2, 2))
mymatrix$get()
mymatrix$getinverse()
cacheSolve(mymatrix)

## Thanks
