pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # initialize a vector
  pullutantvector <- numeric(0)
  
  # formalize the directory string
  filename <- paste(substr(as.character(id+1000),2,4), ".csv", sep = '')
  filedir <- paste(directory, filename, sep = '/')
  
  for (i in seq_along(filedir)) { 
    # read the data 
    data <- read.csv(filedir[i], header = TRUE)
    
    # get the specified column, and add it to the new vector
    pullutantvector <- c(pullutantvector, data[[pollutant]])    
  }
  
  mean(pullutantvector, na.rm = TRUE)
  
}