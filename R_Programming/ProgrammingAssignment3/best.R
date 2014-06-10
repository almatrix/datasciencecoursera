best <- function(state, outcome) {
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
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    ls_outcome_col = c(11, 17, 23)
    outcome_col_index = ls_outcome_col[match(outcome, ls_outcome)]
    
    data_in_state = split(data,ls_state)[[state]]
    data_in_state_outcome = as.numeric(data_in_state[,outcome_col_index])
    min = min( data_in_state_outcome, na.rm = TRUE)
    best_hosp = data_in_state[
        which( data_in_state_outcome == min ),
        2]
    
    best_hosp
}