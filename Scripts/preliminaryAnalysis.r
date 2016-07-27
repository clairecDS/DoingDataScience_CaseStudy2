# This script conducts a preliminary analysis of the time series in order to build the business portfolio.
# checkfiles.r contains a series of functions that produce a CSV file of filenames and dates they were modified.  The purpose
# of the functions is to check PNG files and the .r files that produce them to ensure they are up to date.  If they do not
# exist or are not up to date the plots will be reproduced.
source("Scripts/Utilities/checkFiles.r")

if(!file.exists("checkFile.csv")) {
  buildFileList("Plots")
}

checkFile <- read.csv("checkFile.csv", stringsAsFactors = FALSE)
checkFile$Date_Modified <- as.POSIXct(checkFile$Date_Modified)

# plot each time series
# checkPlot ensures the plot exists and that it is up to date
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

# Test the correlation between As Is and Plan data in order to test how exact the planning data is.
print("Correlation between Total As Is and Total Plan: ", quote = FALSE)
print(cor(TotalAsIs, TotalPlan ))
print("Correlation between Total Etel As Is and Total Etel Plan: ", quote = FALSE)
print(cor(TotalEtelAsIs, TotalEtelPlan))
print("Correlation between Year As Is and Year Plan: ", quote = FALSE)
print(cor(YearAsIs, YearPlan))

# Show linear relationship between As Is and Plan data
TotalAsIs_lm <- lm(TotalAsIs ~ TotalPlan , data = TotalAsIs)
print(summary(TotalAsIs_lm))
TotalAsIs_tslm <- tslm(TotalAsIs ~ TotalPlan )
print(summary(TotalAsIs_tslm))

# The time series can be analysed using the stl function in order to seperate the trend, seasonality and
# remainder (remaining coincidential) components from one another.
TotalAsIs_stl <- stl(TotalAsIs, s.window=5)
TotalEtelAsIs_stl <- stl(TotalEtelAsIs, s.window=5)

# plot stl
# checkPlot ensures the plot exists and that it is up to date
if(!checkPlot("./Plots/TotalAsIs_stl")) { #checks to see if plot exists and is up to date
  source("Plots/TotalAsIs_stl.r")
}


if(!checkPlot("./Plots/TotalEtelAsIs_stl")) { #checks to see if plot exists and is up to date
  source("Plots/TotalEtelAsIs_stl.r")
}


if(!checkPlot("./Plots/STL_TimeSeries_trend")) { #checks to see if plot exists and is up to date
  source("Plots/STL_TimeSeries_trend.r")
}


if(!checkPlot("./Plots/STL_TimeSeries_seasonal")) { #checks to see if plot exists and is up to date
  source("Plots/STL_TimeSeries_seasonal.r")
}




