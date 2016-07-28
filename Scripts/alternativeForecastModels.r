#The script makes alternative forecast models for 2014, it also outputs .csv files of the data.

source("Scripts/Utilities/checkFiles.r")

#checks to see if checkFile.csv has been built, checkFile.csv stores when tracked files have been last modified
if(!file.exists("checkFile.csv")) {
  buildFileList("Plots")
}

checkFile <- read.csv("checkFile.csv", stringsAsFactors = FALSE)
checkFile$Date_Modified <- as.POSIXct(checkFile$Date_Modified)

####Developing forecasting models with alternative model approaches
####Exponential Smoothing

# Exponential Smoothing uses past values to calculate a forecast. The strength 
# with which each value influences the forecast is weakened with help of a 
# smoothing parameter. Thus we are dealing with a weighted average, whose 
# values fade out the longer ago they were in the past.

####Simple expontential smoothing

# Formula: ses(). It must be decided if alpha (the smoothing parameter
# should be automatically calculated. If initial=simple, the alpha value can 
# be set to any chosen value, if initial=optimal (or nothing, as this is the 
# default), alpha will be set to the optimal value based on ets().
# h=12 gives the number of cycles for the forecast.

Model_ses <- ses(TotalAsIs, h=12)

if(!checkPlot("./Plots/Model_ses_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ses_plot.r")
}


# The Akaike's Information Criterion(AIC/AICc) or the Bayesian Information 
# Criterion (BIC) should be at minimum.



if(!checkPlot("./Plots/Model_ses_plot2")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ses_plot2.r")
}

#####Holt's linear trend method:

# Holt added to the model in order to forecast using trends as well.
# For this it is necessary to add a beta, which determines the trend.
# If neither alpha nor beta is stated, both parameters will be optimised
# using ets(). 

Model_holt_1 <- holt(TotalAsIs,h=12)

if(!checkPlot("./Plots/Model_holt_1_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_holt_1_plot.r")
}

# The trend is exponential if the intercepts(level) and the gradient (slope) are
# multiplied with eachother. The values are worse. As the Beta was very low in 
# the optimisation, the forecast is very similar to the ses() model. 


Model_holt_2<- holt(TotalAsIs, exponential=TRUE,h=12)


if(!checkPlot("./Plots/Model_holt_2_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_holt_2_plot.r")
}

# As such simple trends tend to forecast the future to positively, we have added
# a dampener.
# Similar values to that of Model_holt_1 

Model_holt_3 <- holt(TotalAsIs, damped=TRUE,h=12)


if(!checkPlot("./Plots/Model_holt_3_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_holt_3_plot.r")
}

# This also works for exponential trends. 
# The values remain worse. 

Model_holt_4 <- holt(TotalAsIs, exponential=TRUE, damped=TRUE,h=12)


if(!checkPlot("./Plots/Model_holt_4_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_holt_4_plot.r")
}


if(!checkPlot("./Plots/holt_master_plot")) { #checks to see if plot exists and is up to date
  source("Plots/holt_master_plot.r")
}

# As these forecasts are not very convincing at the moment, there is no need 
# to export the data.

####Holt-Winter's Seasonal Method

# Holt and Winters have expanded Holt's model further to include the
# seasonality aspect. The parameter gamma, which is for smoothing the
# seasonality, was added to achieve this. The values are better than 
# the models without seasonality. This logical matches our results from the regression approaches, 
# the data is strongly influenced by seasonality. 
# In the following model, none of the parameters are given so that they
# will be optimised automatically. There are two models: one using
# an additive error model method and one using a multiplicative error model.


Model_hw_1 <- hw(TotalAsIs ,seasonal="additive",h=12)

if(!checkPlot("./Plots/Model_hw_1_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_hw_1_plot.r")
}


#     AIC     AICc      BIC 
#2127.984 2137.875 2164.411 

Model_hw_2 <- hw(TotalAsIs ,seasonal="multiplicative",h=12)

if(!checkPlot("./Plots/Model_hw_2_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_hw_2_plot.r")
}


#     AIC     AICc      BIC 
#2137.673 2147.564 2174.100 

# The additive model gives slightly better results than the multiplicative model.



if(!checkPlot("./Plots/Master_hold_hw_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Master_hold_hw_plot.r")
}

# In order to use the results later, they need to be converted into point forcasts.
Model_hw_1_df <-as.data.frame(Model_hw_1) 
Model_hw_1_PointForecast <- ts(Model_hw_1_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)


Model_hw_2_df <-as.data.frame(Model_hw_2) 
Model_hw_2_PointForecast <- ts(Model_hw_2_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)


if(!file.exists("Model_hw_1_PointForecast.csv")) {
write.csv(Model_hw_1_PointForecast,file='Model_hw_1_PointForecast.csv')
}
if(!file.exists("Model_hw_2_PointForecast.csv")) {
  write.csv(Model_hw_2_PointForecast,file='Model_hw_2_PointForecast.csv')
}

####Innovations state space models for exponential smoothing

# The funktion ets() produces a model with the same values as Model_hw_1. 
# The reason for this is that all of the parameters in this model were optimised 
# using the ets() function. The results are a ets(A,A,A) model which is an 
# additive method for trend, seasonality and errors. The previous models
# also showed the type of ets() model in their summary. In this case the user
# parameters were either accepted or rejected. As the model has been set to 
# "ZZZ", the best model will be automatically chosen. 

Model_ets <-ets(TotalAsIs, model="ZZZ", damped=NULL, alpha=NULL, beta=NULL, gamma=NULL, phi=NULL, additive.only=FALSE, lambda=NULL, lower=c(rep(0.0001,3), 0.8), upper=c(rep(0.9999,3),0.98), opt.crit=c("lik","amse","mse","sigma","mae"), nmse=3, bounds=c("both","usual","admissible"), ic=c("aicc","aic","bic"), restrict=TRUE)


if(!checkPlot("./Plots/Model_ets_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ets_plot.r")
}


Model_ets_forecast <- forecast(Model_ets,h=12)


if(!checkPlot("./Plots/Model_ets_forecast_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ets_forecast_plot.r")
}

#     AIC     AICc      BIC 
#2127.984 2137.875 2164.411 

# In order to use the results later, they need to be converted into point forcasts.
Model_ets_forecast_df <-as.data.frame(Model_ets_forecast) 
Model_ets_PointForecast <- ts(Model_ets_forecast_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)


# Output instruction for the data export of the results for further use in Excel.
if(!file.exists("Model_ets_PointForecast.csv")) {
  write.csv(Model_ets_PointForecast,file='Model_ets_PointForecast.csv')
}


###8.2 ARIMA       							                                                #

### AR = Autoregression
# A Regression of a variable with itself. The autoregressive model specifies 
# that the output variable depends linearly on its own previous values.

### MA = Moving Average
# The rolling average of past forecast errors.
# This model should not be confused with moving average smoothing, which is used
# for establishing trends and is based on past values. 

### ARIMA = AutoRegressive Integrated Moving Average model
# A combination of Differencing, Autoregression and Moving Average.
# Integration is the opposite of differencing.

### Differencing
# In order to make the time series stationary, it is necessary to difference.
# Firstly, we need to check if the data are already stationary. This can be done
# with help of the Augmented Dickey-Fuller Test
#adf.test(TotalAsIs, alternative = "stationary")
# The p-value is less than 0,05. This means that the data is stationary, 
# as the 0-Hypothesis of the test is "The data are not stationary".

# Another possibility is the Kwiatkowski-Phillips-Schmidt-Shin Test
#kpss.test(TotalAsIs)
# This test swaps the hypothesis so that a low p-value means that it
# is necessary to difference. The p-value here is under 0,01 and a warning
# is shown.

# As the test failed to deliver a clear result, the data will be differenced 
# and then retested. 

ChulwalarDiff <- diff(TotalAsIs)

#adf.test(ChulwalarDiff, alternative = "stationary")
#kpss.test(ChulwalarDiff)
# The kpss.test now has a p-value of more than 0,1, which hints that the data
# is stationary. 

tsdisplay(ChulwalarDiff)
# However this plot shows that the months correlate stongly with the values
# from the previous year. This plot shows a  ACF
# (autocorrelation function) and a PACF (partial autocorrelation function).

# The folling is a test method to distinguish the number of "normal" 
# differencing rounds and seasonal differencing rounds. 
# Seasonal differencing is used for data which is dominated by seasonality.
# The time series has been assigned a lag.

ns <- nsdiffs(TotalAsIs)
if(ns > 0) {
  xstar <- diff(TotalAsIs,lag=frequency(TotalAsIs),differences=ns)
} else {
  xstar <- TotalAsIs
}
nd <- ndiffs(xstar)
if(nd > 0) {
  xstar <- diff(xstar,differences=nd)
}



# If "lag" is set to 12, this is equivalent to 1* seasonal differencing
ChulwalarDiff_lag <- diff(TotalAsIs,lag=12)




if(!checkPlot("./ChulwalarDiff_plot")) { #checks to see if plot exists and is up to date
  source("Plots/ChulwalarDiff_plot.r")
}

# The time series appears much more "stationary".

####ARIMA modelling

# The values for AIC, AICc and BIC should be minimised.
# We wil try a range of combinations.

# R uses the maximum likelihood estimation (MLE) in order to decide how good
# a certain model is. The parameters, which give the most likely model based on the given data, are chosen.
# Furthermore, R gives the log-likelihood, which should be maximised. 

Model_ARIMA_1  <- Arima(TotalAsIs, order=c(0,1,0))


if(!checkPlot("./Model_ARIMA_1_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_1_plot.r")
}


#AIC=2101.93   AICc=2101.99   BIC=2104.19

Model_ARIMA_2 <- Arima(TotalAsIs, order=c(1,1,0))

if(!checkPlot("./Model_ARIMA_2_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_2_plot.r")
}


#AIC=2099.2   AICc=2099.38   BIC=2103.72

Model_ARIMA_3 <- Arima(TotalAsIs, order=c(1,1,1))

if(!checkPlot("./Model_ARIMA_3_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_3_plot.r")
}

#AIC=2093.09   AICc=2093.45   BIC=2099.88

Model_ARIMA_4 <- Arima(TotalAsIs, order=c(2,1,1))


if(!checkPlot("./Model_ARIMA_4_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_4_plot.r")
}

#AIC=2095.08   AICc=2095.68   BIC=2104.13

Model_ARIMA_5 <- Arima(TotalAsIs, order=c(2,1,2))


if(!checkPlot("./Model_ARIMA_5_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_5_plot.r")
}

#AIC=2091.07   AICc=2092   BIC=2102.39

Model_ARIMA_6 <- Arima(TotalAsIs, order=c(3,1,2))


if(!checkPlot("./Model_ARIMA_6_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_6_plot.r")
}

#AIC=2092.3   AICc=2093.61   BIC=2105.87

Model_ARIMA_7 <- Arima(TotalAsIs, order=c(3,1,3))


if(!checkPlot("./Model_ARIMA_7_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_7_plot.r")
}

#AIC=2094.03   AICc=2095.81   BIC=2109.87

Model_ARIMA_8 <- Arima(TotalAsIs, order=c(3,1,1))


if(!checkPlot("./Model_ARIMA_8_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_8_plot.r")
}


#AIC=2096.57   AICc=2097.5   BIC=2107.89

Model_ARIMA_9 <- Arima(TotalAsIs, order=c(3,1,2))


if(!checkPlot("./Model_ARIMA_9_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_9_plot.r")
}


#AIC=2092.3   AICc=2093.61   BIC=2105.87

Model_ARIMA_10 <- Arima(TotalAsIs, order=c(1,1,3))


if(!checkPlot("./Model_ARIMA_10_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_10_plot.r")
}

#AIC=2096.69   AICc=2097.61   BIC=2108

Model_ARIMA_11 <- Arima(TotalAsIs, order=c(2,1,3))


if(!checkPlot("./Model_ARIMA_11_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_11_plot.r")
}

#AIC=2085.22   AICc=2086.53   BIC=2098.8

Model_ARIMA_12 <- Arima(TotalAsIs, order=c(2,2,3))


if(!checkPlot("./Model_ARIMA_12_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_12_plot.r")
}

#AIC=2065.39   AICc=2066.72   BIC=2078.88

Model_ARIMA_13 <- Arima(TotalAsIs, order=c(2,3,2))


if(!checkPlot("./Model_ARIMA_13_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_ARIMA_13_plot.r")
}

#AIC=2061.27   AICc=2062.22   BIC=2072.44

Acf(residuals(Model_ARIMA_13))
# The Ljung-Box Test has H0: The data are independently distributed 
# und Ha: The data are not independently distributed. 

# Just like the remainder showed before, there is a definite coherence#  

#### Seasonal ARIMA modelling

# This model integrates the seasonal aspect into the ARIMA model. As the previous
# models all had a peak in lag 12, it seems viable that the data are seasonal. 

Model_Seasonal_ARIMA_0 <- Arima(TotalAsIs, order=c(0,0,0), seasonal=c(1,0,0))
tsdisplay(residuals(Model_Seasonal_ARIMA_0))

#AIC=2105.79   AICc=2106.14   BIC=2112.62

Model_Seasonal_ARIMA_1 <- Arima(TotalAsIs, order=c(0,1,1), seasonal=c(0,1,1))


if(!checkPlot("./Model_Seasonal_ARIMA_1_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_Seasonal_ARIMA_1_plot.r")
}

#AIC=1672.88   AICc=1673.31   BIC=1679.11

# Insert the values from the previous chapter for the non-seasonal values. 
Model_Seasonal_ARIMA_2 <- Arima(TotalAsIs, order=c(2,3,2), seasonal=c(1,1,1))
tsdisplay(residuals(Model_Seasonal_ARIMA_2))


if(!checkPlot("./Model_Seasonal_ARIMA_2_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_Seasonal_ARIMA_2_plot.r")
}

# AIC=1630.23   AICc=1632.51   BIC=1644.53

# Good results when using drift.
Model_Seasonal_ARIMA_3 <- Arima(TotalAsIs, order=c(1,0,1), seasonal=c(1,1,1),include.drift=TRUE)
tsdisplay(residuals(Model_Seasonal_ARIMA_3))

if(!checkPlot("./Model_Seasonal_ARIMA_3_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_Seasonal_ARIMA_3_plot.r")
}

# AIC=1355.99   AICc=1357.58   BIC=1368.56

Model_Seasonal_ARIMA_4 <- Arima(TotalAsIs, order=c(2,3,2), seasonal=c(1,3,2))
tsdisplay(residuals(Model_Seasonal_ARIMA_4))


if(!checkPlot("./Model_Seasonal_ARIMA_4_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_Seasonal_ARIMA_4_plot.r")
}

# AIC=1630.23   AICc=1632.51   BIC=1644.53
# The stronger the seasonality is differenced, the better the results are. However the 
# plot shows that the data are being increasingly changed. 

Model_Seasonal_ARIMA_5 <- Arima(TotalAsIs, order=c(2,3,2), seasonal=c(1,4,2))
tsdisplay(residuals(Model_Seasonal_ARIMA_5))


if(!checkPlot("./Model_Seasonal_ARIMA_5_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_Seasonal_ARIMA_5_plot.r")
}

# AIC=765   AICc=777   BIC=773.36

# The more the seasonal aspect is changed, the better the results based on AIC,
# AICc and BIC. Theoretically the models should more and more suitable for the forecast.
# However, a look at the plot of the forecasts shows that the changes are making the 
# data less and less convincing and thus unuseable. 


#####Auto-ARIMA modelling

# The automatic establishment of an ARIMA model shows that (2,0,1)(0,1,1)
# with drift delivers the best results. 
# AIC=1344.04   AICc=1345.62   BIC=1356.6
# For comparison, here are the results of ModelWithTrendAndSeasonalityOnly with tslm():
#          CV          AIC         AICc          BIC        AdjR2 
# 8.472378e+10    1810.912      1818.281    1842.786    0.9004392 

Model_auto.arima <- auto.arima(TotalAsIs)


Acf(residuals(Model_auto.arima))
# The Ljung-Box Test has H0: The data are independently distributed 
# and Ha: The data are not independently distributed. The results show: White noise

Model_auto.arima_forecast <- forecast(Model_auto.arima,h=12)


if(!checkPlot("./Model_auto_arima_forecast_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_auto_arima_forecast_plot.r")
}



Model_auto.arima_forecast_df <-as.data.frame(Model_auto.arima_forecast) 
Model_auto.arima_PointForecast <- ts(Model_auto.arima_forecast_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)


# Output instruction for the data export of the results for further use in Excel.
#write.csv(Model_auto.arima_PointForecast,file='Model_auto.arima_PointForecast.csv')

###8.3 Dynamic regression models

# Regression models are combined with ARIMA models on order to make sure that
# external factors are included and that the time series are not only forecasted 
# based on past values. A regression of the ARIMA errors should be aspired for. 

# We have to diffentiate, as the time series and the SIGov Indicator are not 
# stationary. So that a forecast can be produced, the indicator has to be lagged
# so that we have values for 2014. 

CEPI_lagged <- ts(c(rep(NA,12),CEPIVector),start=c(2008,1), end=c(2013,12), frequency=12)
CEPI_2014_lagged <- ts(CEPI_2013, start=c(2014,1), end=c(2014,12), frequency=12)

Model_dynreg <- Arima(TotalAsIs, xreg=CEPI_lagged, order=c(2,2,0))
tsdisplay(arima.errors(Model_dynreg), main="ARIMA errors")

Model_dynreg_auto.arima <- auto.arima(TotalAsIs, xreg=CEPI_lagged)

tsdisplay(arima.errors(Model_dynreg_auto.arima), main="ARIMA errors")
# ARIMA(2,0,1)(0,1,1)[12] with drift 
# AIC=1343.61   AICc=1345.76   BIC=1358.27


Acf(residuals(Model_dynreg_auto.arima))
# The Ljung-Box Test has H0: The data are independently distributed 
# and Ha: The data are not independently distributed. The results show: 
# White noise


Model_dynreg_auto.arima_forecast <- forecast(Model_dynreg_auto.arima, xreg=CEPI_2014_lagged,h=12)



if(!checkPlot("./Model_dynreg_auto_arima_forecast_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Model_dynreg_auto_arima_forecast_plot.r")
}


Model_dynreg_auto.arima_forecast_df <-as.data.frame(Model_dynreg_auto.arima_forecast) 
Model_dynreg_auto.arima_PointForecast <- ts(Model_dynreg_auto.arima_forecast_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)


# Output instruction for the data export of the results for further use in Excel.
if(!file.exists("Model_dynreg_auto.arima_PointForecast.csv")) {
  write.csv(Model_dynreg_auto.arima_PointForecast,file='Model_dynreg_auto.arima_PointForecast.csv')
}