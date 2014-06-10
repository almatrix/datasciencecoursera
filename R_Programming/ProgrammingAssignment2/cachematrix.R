## get the reverse of a matrix from cache (if existed)
## to save computing sources


## create a special "matrix" that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        
        inv <- NULL
        copy <- NULL
        
        get <- function() x
        set <- function(y){
                x <<- y
                inv <<- NULL
        }
        
        getCopy <- function() copy
        setCopy <- function(cp) copy <<- cp
        
        getInv <- function() inv
        setInv <- function(inverse) inv <<- inverse
        
        list(get = get, set=set, 
             getCopy=getCopy, setCopy=setCopy,
             getInv=getInv, setInv=setInv) 
}



## return the inverse 
## if data is not changed and inverse is in the cache, just return
## else calculate the inverse, store it in the cache, and return
cacheSolve <- function(x, ...) {
        
        ## get data as well as a self copy from cache
        data = x$get()
        copy = x$getCopy()
        
        if(is.null(copy)){ # no copy in cache, create a copy            
                message ("1: No self copy found in cache.")
                message ("2: Create a copy")
                x$setCopy(data)
                        
        } else {  # if there is a copy in cache, compare them
                message ("1: Self copy found in cache.")
                
                # compare data with copy
                if ( identical(copy,data) ){  # if not changed
                        message ("2: Matrix not changed.") 
                        
                        ## find if there is an inverse in cache 
                        inv = x$getInv()
                        if(!is.null(inv)){
                                message("3: Inverse found in cache. Return cache.")
                                return (inv)
                        } else {
                                message ("3: Inverse not found.")                  
                        }
                        
                } else {  # if matrix has been changed
                        message ("2: Matrix changed.")   
                }
        }
        
        message("3: Calculate the reverse and save to cache.")
        inv = solve(data)
        x$setInv(inv)
        
        inv

}


# ############# code testing ############### 
# mat=matrix(c(1,3,2,2,5,6,3,4,1),3,3)
# ## test 1 ##
# x=makeCacheMatrix(mat)
# cacheSolve(x)
# ## test 2 ##
# cacheSolve(x)
# ## test 3 ##
# x$set(matrix(c(1,3,2,2,5,6,3,2,1),3,3))
# cacheSolve(x)
# ############# code testing ############### 