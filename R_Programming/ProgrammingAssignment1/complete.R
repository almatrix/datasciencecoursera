complete <- function(directory, id = 1:332) {
  
  # formalize the directory string
  filename <- paste(substr(as.character(id+1000),2,4), ".csv", sep = '')
  filedir <- paste(directory, filename, sep = '/')
  
  nobs <- seq_along(id)
  for (i in seq_along(filedir)) { 
    # read the data 
    data <- read.csv(filedir[i], header = TRUE)
    #keep the non-NA rows
    data <- data[complete.cases(data),]
    nobs[i] <- nrow(data)  
  }
  
  data.frame(id,nobs)
}