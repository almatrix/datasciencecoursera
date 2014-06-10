rankall <- function(outcome, num = "best") {
    ## Read outcome data
    hospdata <- read.csv("outcome-of-care-measures.csv", 
                     colClasses = "character")
    
    ## Check that the outcome is valid
    ls_outcome = c("heart attack", "heart failure", "pneumonia")
    if(!is.element(outcome, ls_outcome)){
        stop("invalid outcome")
    }
    
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    ls_outcome_col = c(11, 17, 23)
    outcome_col_index = ls_outcome_col[match(outcome, ls_outcome)] 
    
    data_groups = split(hospdata,hospdata$State)  
    states_number = length(data_groups)    
    
    ordered_hosps_in_each_state = 
        sapply( seq_along(data_groups), 
                function(i) {
                    data_in_state = data_groups[[i]]
                    data_in_state_outcome = as.numeric(data_in_state[,outcome_col_index])
                    ordered_index = order( data_in_state_outcome, data_in_state[,2],  
                               na.last=NA )
                    if(num =="best") hosp = head(ordered_index,1)
                    else if(num == "worst") hosp = tail(ordered_index,1)
                    else hosp = ordered_index[num]
                    
                    c(data_in_state[hosp,2], 
                      data_in_state[1,7])

                }
              ) 
    
    
    
    data_frame=data.frame(matrix(unlist(ordered_hosps_in_each_state), 
                                 nrow=states_number, byrow=T))
    colnames(data_frame)=c("hospital","state")
    rownamevec = data_frame$state
    rownames(data_frame)=rownamevec
    
    data_frame
}