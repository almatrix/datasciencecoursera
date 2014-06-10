rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", 
                     colClasses = "character")
    
    ## Check that state and outcome are valid
    ls_state = data$State
    if(!is.element(state, ls_state)){
        stop("invalid state")
    }
    ls_outcome = c("heart attack", "heart failure", "pneumonia")
    if(!is.element(outcome, ls_outcome)){
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    ls_outcome_col = c(11, 17, 23)
    outcome_col_index = ls_outcome_col[match(outcome, ls_outcome)]
    
    data_in_state = split(data,ls_state)[[state]]
    data_in_state_outcome = as.numeric(data_in_state[,outcome_col_index])
    ordered_hosps = data_in_state[
        order( data_in_state_outcome, data_in_state[,2],  na.last=NA ), 
        2]
    
    if (num == "best"){
        hosp = head(ordered_hosps,1)
    } else if (num == "worst"){
        hosp = tail(ordered_hosps,1)
    } else {
        hosp = ordered_hosps[num]
    }
    
    hosp
}