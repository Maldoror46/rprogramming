complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    ## Get list of files
    
    file_list <- list.files(as.character(directory), full.names=TRUE)[id]  
    
    ## initialise df and popluate
    data.all<-data.frame()
    
    for (i in 1:length(file_list)){
        temp_data<-read.csv(file_list[i])
        comp_cases<-!(is.na(temp_data$sulfate)|is.na(temp_data$nitrate))
        sum<-sum(comp_cases)
        index<-temp_data$ID[1]
        data.all<-rbind(data.all,c(index, sum))        
    }
    names(data.all)[1]<-"ID"
    names(data.all)[2]<-"nobs"
    
    return(data.all)
}