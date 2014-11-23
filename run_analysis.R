run_analysis <- function(){
    ## step 1. make sure the working directory is your home directory
    ## the data is actually residing in Coursera/Module 3/Project subdirectory
    ## step 2. run this function to read the tables
    ## step 3. return the working directory to your home directory
    hme <- getwd()
    setwd("./Coursera")
    setwd("./Module 3")
    setwd("./Project")
    setwd("./UCI HAR Dataset")
    
    ## read activity labels and features, i.e. variable names
    ## al vector representing activity labels
    ## ft vector representing features
    al <- read.table("activity_labels.txt")
    ft <- read.table("features.txt")
    
    ## read train set data
    ## trgst vector representing subject train data
    ## trgxt vector representing x train data
    ## trgyt vector representing y train data
    setwd("./train")
    trgst <- read.table("subject_train.txt")
    trgxt <- read.table("x_train.txt")
    trgyt <- read.table("y_train.txt")
    setwd("./..")
    
    ## read test set data
    ## tstst vector representing subject test data
    ## tstxt vector representing x test data
    ## tstyt vector representing y test data
    setwd("./test")
    tstst <- read.table("subject_test.txt")
    tstxt <- read.table("x_test.txt")
    tstyt <- read.table("y_test.txt")
    setwd("./..")
    
    ## set working directory back
    setwd(hme)
    
    ## merge train and test set data
    ## st vector representing subject data
    ## xt vector representing x data
    ## yt vector representing y data
    st <- rbind(trgst,tstst)
    xt <- rbind(trgxt,tstxt)
    yt <- rbind(trgyt,tstyt)
    
    ## replace the activity values with descriptive activity labels
    ## ytl is a vector where each number is replaced by its corresponding activity label using gsub
    ## ytl <- yt
    ## for (i in 1:nrow(al)) {
    ##    ytl <- gsub(as.character(al$V1[i]),al$V2[i],ytl)
    ## }
    for (i in 1:nrow(yt)){
        ytl$V1[i] <- as.character(al$V2[yt$V1[i]])
    }

    ## merge the data frames st, subject, x data and y data into one data frame called df
    df <- cbind(st,xt,ytl)
    
    ## step meaningful dimension names
    ## create vector co2, the second set of colum names derived from the features.txt table respresenting the column names
    ## convert all to lowercase
    co2 <- as.character(ft$V2)
    co2 <- tolower(co2)
    
    ## create the row names by pasting "obs" with the row number, representing the observation number
    ro <- paste("obs",1:nrow(xt))
    
    ## create all, column names, the ID, followed by the features, follwed by the activity label
    co <- c("id",co2,"actlabel")
    
    ## set meaningful dimension names
    dimnames(df) <- list(ro,co)
    
    ## subset the data by...
    ## creating a logical vector mn representing those column names where mean() is present as TRUE
    ## creating a logical vector sd representing those column names where std() is present as TRUE
    ## creating a logical vector mnsd representing ythose columns mean() or std()
    ## the subset the data frame with the selected columns
    ## do not forget to reinclude the Subject ID, column 1, and Activity Label, the last column
    mn <- grepl("mean()",names(df),fixed=TRUE)
    sd <- grepl("std()",names(df),fixed=TRUE)
    mnsd <- mn | sd
    mnsd[1] <- TRUE
    mnsd[length(mnsd)] <- TRUE
    dfs <- subset(df,select=mnsd)
    
    ## make a tidy data set
    ## split the data set follwoing the activity label and the id
    dfsplit <- split(dfs,list(dfs$actlabel,dfs$id))
    
    ## calculate the column Means but excluding the ID and Activity label column by only using columns 2 till 67
    ## as ID is in the first column -1- and activity label in the last -68- 
    q <- lapply(dfsplit,function(x) colMeans(x[c(2:67)]))
    
    ## this retuns the table q
}
