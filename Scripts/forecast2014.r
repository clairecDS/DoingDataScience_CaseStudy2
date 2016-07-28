#The script conducts the forecast for 2014, it also outputs .csv files for the 2014 forecast and alterntaive forecast.

source("Scripts/Utilities/checkFiles.r")

#checks to see if checkFile.csv has been built, checkFile.csv stores when tracked files have been last modified
if(!file.exists("checkFile.csv")) {
  buildFileList("Plots")
}

checkFile <- read.csv("checkFile.csv", stringsAsFactors = FALSE)
checkFile$Date_Modified <- as.POSIXct(checkFile$Date_Modified)

#As ModelWithLowCorrelatingIndicators was the one of best fitting model for a forecast, the exports data for 2014 will be forecast
# based on trend and seasonality and NationalHolidays, UrbanoExports and GlobalisationPartyMembers. 
Forecast_ModelWithLowCorrelatingIndicators_2014 <- forecast(ModelWithLowCorrelatingIndicators,newdata=data.frame(NationalHolidays=NationalHolidays_2014, UrbanoExports= UrbanoExports_2014, GlobalisationPartyMembers=GlobalisationPartyMembers_2014),h=12)

if(!checkPlot("./Plots/Forecast_ModelWithLowCorrelatingIndicators_2014_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Forecast_ModelWithLowCorrelatingIndicators_2014_plot.r")
}


Forecast_ModelWithLowCorrelatingIndicators_2014_df <-as.data.frame(Forecast_ModelWithLowCorrelatingIndicators_2014) 
PointForecast_ModelWithLowCorrelatingIndicators_2014 <- ts(Forecast_ModelWithLowCorrelatingIndicators_2014_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)



# As ModelWithTrendAndSeasonalityOnly also gave a well fitting model for a forecast, the exports data for 2014 will be forecast
# based on trend and seasonality. 

Forecast_2014 <- forecast(ModelWithTrendAndSeasonalityOnly,h=12)


if(!checkPlot("./Plots/Forecast_2014_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Forecast_2014_plot.r")
}

Forecast_2014_df <-as.data.frame(Forecast_2014) 
PointForecast_TrendAndSeasonality_2014 <- ts(Forecast_2014_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)



# Output instruction for the data export of the results for further use in Excel. 
if(!file.exists("PointForecast_TrendAndSeasonality_2014.csv")) {
  write.csv(PointForecast_TrendAndSeasonality_2014,file='PointForecast_TrendAndSeasonality_2014.csv')
}


### ALTERNATIVE###
# As the indiators NationalHolidays delievered a good result, but could not convince in the 2013 forecast,
# it could be possible that the data for 2013 was to blame. Therefore there is another Forecast using the
# ModelWithNationalHolidays

Forecast_2014_alternative <- forecast(ModelWithNationalHolidays, newdata=data.frame(NationalHolidays=NationalHolidays_2014),h=12)

if(!checkPlot("./Plots/Forecast_2014_alternative_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Forecast_2014_alternative_plot.r")
}

Forecast_2014_alternative_df <-as.data.frame(Forecast_2014_alternative) 
PointForecast_2014_alternative <- ts(Forecast_2014_alternative_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)


# Output instruction for the data export of the results for further use in Excel.
if(!file.exists("PointForecast_2014_alternative.csv")) {
  write.csv(PointForecast_2014_alternative,file='PointForecast_2014_alternative.csv')
}
