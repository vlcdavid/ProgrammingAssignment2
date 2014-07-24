#Creates a container matrix object that can cache its inverse
makeCacheMatraix<-function(x=matrix()){
       #initialize the inverse property
        m<-NULL
        #method to set the matrix
        set<-function(y){
                x<<-y
                m<<-NULL
        }
        #method the get the matrix
        get<-function()x
        setmatrix<-function(solve)m<<-solve
        #method to get the inverse of the matrix
        getmatrix<-funciton()m
        #return a list of the methods
        list(set=set,get=get,
             setmatrix=setmatrix,
             getmatrix=getmatrix)
}
cacheSolve<-function(x=matrix(),...){
        #return a matrix that is the inverse of "x"
        m<-x$getmatrix()
        #just return the inverse if tis already set
        if(!is.null(m)){
                message("Getting cached data")
                return(m)
        }
        #get the matrix from our object
        matrix<-x$get()
        #calculate the inverse using matrix multiplication
        m<-solve(matrix,...)
        #set the inverse to the object
        x$setmatrix(m)
        #Return the matrix
        m
}