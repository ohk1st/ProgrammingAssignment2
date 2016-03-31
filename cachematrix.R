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
