#Problem 1

pollutantmean <- function(directory, pollutant, id = 1:332) {
  myfiles <- list.files(directory, full.names = TRUE) #Make a list of all csv files
  values <- numeric() #create a numeric vector
  for (i in id) {
    dt <- read.csv(myfiles[i]) #read each file in the list every loop and save it
    values <- c(values, dt[[pollutant]])  #save value of pollutant and add it to the vector
  }
  mean_dt <- mean(values, na.rm=T) #calculate mean using all values of pollutant from the vector
  return(mean_dt)
}

#How to run:
#Load the source file using the command, source(FirstMiniProj.R)
#Run the FirstMiniProj.R script in RStudio
#Run the ff commands in the console in RStudio to check for the outputs
#pollutantmean("insert your path here", "sulfate", 1:10)
#pollutantmean("insert your path here", "nitrate", 70:72)
#pollutantmean("insert your path here", "nitrate", 23)

#Problem 2

complete <- function(directory, id= 1:332) {
  myfiles <- list.files(directory, full.names = TRUE) #Make a list of all csv files
  nobs <- numeric() #create a numeric vector for no. of observations
  
  for (i in id){
    dt <- read.csv(myfiles[i]) #read each file in the list every loop and save it
    sumdt <- sum(complete.cases(dt)) #compute sum of all complete cases in a file
    nobs <- c(nobs, sumdt) #save sum of that file here
  }
  return (data.frame(id, nobs)) #return a data frame which shows id and no. of observations
}

#Run the ff commands in the console in RStudio to check for the outputs
#complete("insert path here", 1)
#complete("insert path here", c(2, 4, 8, 10, 12))
#complete("insert path here", 30:25)
#complete("insert path here", 3)

#Problem 3

corr <- function(directory, threshold = 0){
  myfiles <- list.files(directory, full.names = TRUE) #Make a list of all csv files
  compcases <- complete(directory) #use complete() function to return a data frame of the files
  id <- compcases[compcases["nobs"] > threshold, ]$id #subset the ids or files that have observations greater than the threshold
  corrtable <- data.frame() #data frame to store the corr values
  
  for (i in id){ #loop in the ids with nobs greater than the threshold
    dt <- read.csv(myfiles[i]) #read each file
    ccfile <- dt[complete.cases(data), ] #get complete cases in that file
    corrtable <- c(corrtable, cor(ccfile$sulfate, ccfile$nitrate)) #get correlation of the complete cases in that file
  }
  return (corrtable)
}

#Run the ff commands in the console in RStudio to check for the outputs
#cr<-corr("insert path here", 150)
#head(cr)
#summary(cr)