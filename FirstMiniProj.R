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