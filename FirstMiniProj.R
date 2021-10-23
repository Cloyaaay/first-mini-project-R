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