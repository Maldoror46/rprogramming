corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    file_list <- list.files(as.character(directory), full.names=TRUE)
    
    ## initialise df and popluate
    cr<-c()
    
    for (i in 1:length(file_list)){
        temp_data<-read.csv(file_list[i])
         comp_cases<-!(is.na(temp_data$sulfate)|is.na(temp_data$nitrate))
         sum<-sum(comp_cases)        
         if(sum>threshold){
             temp_corr<-cor(temp_data$sulfate, temp_data$nitrate, use="na.or.complete")  
             cr<-c(cr,temp_corr)
             }
        }
##stuff
return(cr)
}