pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    ## Get list of files
    
    file_list <- list.files(as.character(directory), full.names=TRUE)[id]  
    
    ## initialise df and popluate
    data.all<-data.frame()
    
    for (i in 1:length(file_list)){
        data.all<-rbind(data.all, read.csv(file_list[i]))
    }
    #calculate mean
    
    mean<-mean(data.all[[pollutant]], na.rm=TRUE)
    
}

