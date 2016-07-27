#This script conducts a preliminary analysis of the time series in order to build the business portfolio, check correlation
#between As Is and Plan data, 

source("Scripts/Utilities/checkFiles.r")

if(!file.exists("checkFile.csv")) {
  buildFileList("Plots")
}


checkFile <- read.csv("checkFile.csv", stringsAsFactors = FALSE)
checkFile$Date_Modified <- as.POSIXct(checkFile$Date_Modified)

#plot each time series

if(!checkPlot("./Plots/TotalAsIs_plot1")) { #checks to see if plot exists and is up to date
  source("Plots/TotalAsIs_plot1.r")
}

if(!checkPlot("./Plots/TotalEtelAsIs_plot1")) { #checks to see if plot exists and is up to date
  source("Plots/TotalEtelAsIs_plot1.r")
}

if(!checkPlot("./Plots/TotalPlan_plot1")) { #checks to see if plot exists and is up to date
  source("Plots/TotalPlan_plot1.r")
}

if(!checkPlot("./Plots/TotalEtelPlan_plot1")) { #checks to see if plot exists and is up to date
  source("Plots/TotalEtelPlan_plot1.r")
}

#Test the correlation between As Is and Plan data in order to test how exact the planning data is.

cor(TotalAsIs, TotalPlan )

cor(TotalEtelAsIs, TotalEtelPlan)

cor(YearAsIs, YearPlan)