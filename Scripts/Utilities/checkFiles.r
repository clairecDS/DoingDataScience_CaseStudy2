#Created by Joe Stoffa
#Sometime in June or July 2016
#Work in progress
#
#
#
#This script contains a number of functions to ensure that check to see if a plot exists and that it is current.  If the
#plot in question exists and is current the r script that creates the plot will not be called.

buildFileList <- function(dir = NULL, files = NULL) {
  #determine which arguments have been passed
  if(is.null(dir)) {
    dir <- "."
  } else {
    dir <- paste0("./", dir)
  }
  if(is.null(files)) { #build list of filenames
    files <- list.files(path = dir, pattern = ".[r|R]$", include.dirs = TRUE)
    files <- sapply(files, function(x) paste(dir, x, sep ="/"), USE.NAMES = FALSE)
    }
  
  mod_dates <- vector()
  #get list of dates file was modified
  for (file in files) {
    mod_dates <- append(mod_dates, file.info(file)$mtime)
  }
  
  #build dataframe from filenames, dates
  df <- data.frame(files, mod_dates)
  names(df) <- c("File", "Date_Modified")
  #write csv file
  write.csv(df, "checkFile.csv")
}

updateFileList <- function(fileName) {
  #build this function
}

#checks to see if a plot file exists returns TRUE if the plot exists and it is current; returns FALSE if plot doesn't exist or
#if its not current based on the r script that created it time last modified.  This script relies on the checkfile data frame
#produced by the buildFileList and loadFileList functions
checkPlot <- function(plotName) {
  fileName <- paste0(plotName, ".png")
  rfileName <- paste0(plotName, ".r")
  if(!file.exists(fileName)) return(FALSE)
  else if(isModified(rfileName)) return(FALSE) #check to see if file has been modified
  else return(TRUE)
}

isModified <- function(fileName) { 
  if(checkFile[checkFile$File == fileName,]$Date_Modified < file.info(fileName)$mtime) {
    return(TRUE)
  } else return(FALSE)
}



