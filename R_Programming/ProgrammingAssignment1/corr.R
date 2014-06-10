corr <- function(directory, threshold = 0) {

  id <- c(1:332)
  # select monitors that meet the threshold
  id <- id[complete(directory)[["nobs"]] > threshold]
  
  # initialize an empty vector
  corvector <- numeric(0)
  
  if (length(id)){
    # formalize the directory string
    filename <- paste(substr(as.character(id+1000),2,4), ".csv", sep = '')
    filedir <- paste(directory, filename, sep = '/')
    
    
    for (i in seq_along(filedir)) { 
      # read the data 
      data <- read.csv(filedir[i], header = TRUE)
      
      # compute the correlation between sulfate and nitrate
      corvector = c(corvector, cor( data$sulfate, data$nitrate, use = "complete.obs" ))
    }
  }
  
  corvector
  
}