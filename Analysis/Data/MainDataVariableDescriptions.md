# MainDataVariableDescriptions
Claire Chu  
July 21, 2016  

###These are the Main Data Variable Descriptions for the following datasets<br>
1 ["ImportedAsIsDataChulwalar.csv"](#id-section1.0)<br>
2 ["ImportedPlanDataChulwalar.csv"](#id-section2.0)<br>
3 ["ImportedIndicatorsChulwalar.csv"](#id-section3.0)<br>
4 [Variables Created for Section 1: Prep](#id-section4.0)<br>
5 [Variables Created for Section 2: Analysis](#id-section5.0)<br>
6 [Variables Created for Section 3: Correlation](#id-section6.0)<br>
7 [Variables Created for Section 4: Development of Models](#id-section7.0)<br>
8 [Variables Created for Section 5: Forecasts With Models](#id-section8.0)<br>
9 [Variables Created for Section 6: 2014 Forecasts](#id-section9.0)<br>
10 [Variables Created for Section 7: Model Evaluation](#id-section10.0)<br>
****************************
<div id='id-section1.0'/>
####IMPORTED AS IS DATA

-Monthly As Is exports<br>
-Monthly As Is exports of Efak<br>
-Monthly As Is exports of Wuge<br>
-Monthly As Is exports of Etel (Total)<br>
-Monthly As Is exports of blue Etel<br>
-Monthly As Is exports of red Etel<br>
-Yearly As Is exports<br>

#####Note: since our project is covered the "Total amount of Etel Exports" analysis of some of these variables has been omitted

****************************
<div id='id-section2.0'/>
####IMPORTED PLAN DATA

-Monthly Plan exports <br>
-Monthly Plan exports of Efak<br>
-Monthly Plan exports of Wuge<br>
-Monthly Plan exports of Etel (Total)<br>
-Monthly Plan exports of blue Etel<br>
-Monthly Plan exports of red Etel<br>
-Yearly Plan exports<br>

#####Note: since our project is covered the "Total amount of Etel Exports" analysis of some of these variables has been omitted

****************************
<div id='id-section3.0'/>
####IMPORTED INDICATORS

-Change in Exports prices<br>
-Satisfaction index<br>
-Average Temperature<br>
-Birth Index<br>
-Satisfaction index (Independent)<br>
-Total Exports from Urbano<br>
-Globalization Party Members<br>
-Average Export Price<br>
-Etel Production Price index<br>
-Chulwalar Index<br>
-Inflation<br>
-Spending for Chulwalar holidays<br>
-Chulwalar holidays<br>
-Influence of Chulwalar holidays<br>

#####Note: since our project is covered the "Total amount of Etel Exports" analysis of some of these variables has been omitted

****************************
<div id='id-section4.0'/>
####Time Series of AsIs and Plan data
TotalAsIs<br>
TotalEtelAsIs<br>
YearAsIs<br>
TotalAsIs_2014<br>
TotalPlan<br>
TotalEtelPlan<br>
YearPlan<br>
TotalPlan_2014<br>

****************************
<div id='id-section5.0'/>
####Regression Models
TotalAsIs_lm<br>
TotalAsIs_tslm<br>

####stl models
TotalAsIs_stl<br>
TotalEtelAsIs_stl<br>
YearAsIs_stl<br>

****************************
<div id='id-section6.0'/>
####Time Series of Indicator data
CEPI<br> 
SIGov<br>
Temperature<br> 
Births<br>
SIExtern<br> 
UrbanoExports<br> 
GlobalisationPartyMembers<br>
AEPI<br>
PPIEtel<br>
NationalHolidays<br>
ChulwalarIndex<br> 
Inflation<br> 
IndependenceDayPresents<br>

####Time Series with One month offset for SIExternal
SIExternOffsetByOneMonth

####Time Series with December removed
TotalAsIsWithoutDec12013<br>
TotalEtelAsIsWithoutDec12013<br>

####Regression model with December removed
TotalAsIsWithoutDec2013_lm

####Time Series with two month offset for SIGov
SIGovShifted2Months

####Time Series with November and December Removed
TotalAsIsWithoutNovDec2013<br>
TotalEtelAsIsWithoutNovDec2013<br>

####Regression Model with November and December Removed
TotalAsIsWithoutNovDec2013_lm

####All Indicators in one Matrix
IndicatorsMatrix

####All Scaled Indicators in one Matrix
IndicatorsmatrixStandardised

####Indicators Correlation Coefficient Matrix
IndicatorsCorrelationCoefficientMatrix

****************************
<div id='id-section7.0'/>
####model with all indicators
ModelWithAlllIndicators

####Model with individual indicators
ModelWithCEPI<br>
ModelWithSIGov<br>
ModelWithTemperature<br> 
ModelWithBirths<br>
ModelWithSIExtern<br>
ModelWithUrbanoExports<br> 
ModelWithGlobalisationPartyMembers<br>
ModelWithAEPI<br>
ModelWithPPIEtel<br>
ModelWithNationalHolidays<br>
ModelWithChulwalarIndex<br> 
ModelWithInflation<br>
ModelWithIndependenceDayPresents<br>

####Model with Various Levels of Correlating Indicators
ModelWithHighCorrelatingIndicators<br>
ModelWithLowCorrelatingIndicators<br>

####Model with/without Trend and Seasonality
ModelWithTrendAndSeasonalityOnly<br>
ModelWithoutTrendAndSeasonality<br>

####Model of TotalEtel based on Trend and Seasonality
ModelTotalEtel

****************************
<div id='id-section8.0'/>
####Shortening the exports data in the Time Series in order to be able to compare the produced forecasts with the As Is data
TotalAsIs_2012<br>
TotalEtelAsIs_2012<br>
YearAsIs_2012<br>

####Shortening the indicators by the same amount
CEPI_2012<br> 
SIGov_2012<br>  
Temperature_2012<br> 
Births_2012<br>
SIExtern_2012<br> 
UrbanoExports_2012<br> 
GlobalisationPartyMembers_2012<br>
AEPI_2012<br>
PPIEtel_2012<br>
NationalHolidays_2012<br>
ChulwalarIndex_2012<br> 
Inflation_2012<br> 
IndependenceDayPresents_2012<br>

####Seperate the As Is and Plan data for 2013 in order to be able to compare the forecast to this data.
TotalAsIs_2013<br>
TotalEtelAsIs_2013<br>
YearAsIs_2013<br>
TotalPlan_2013<br>
TotalEtelPlan_2013<br>
YearPlan_2013<br>

####Seperate the indicator data for 2013 and 2014 in order to use these in the forecasts.
CEPI_2013<br>
CEPI_2014<br>
SIGov_2013<br>
SIGov_2014<br>
Temperature_2013<br>
Temperature_2014<br> 
Births_2013<br>
Births_2014<br>
SIExtern_2013<br>
SIExtern_2014<br>
UrbanoExports_2013<br>
UrbanoExports_2014<br>
GlobalisationPartyMembers_2013<br>
GlobalisationPartyMembers_2014<br>
AEPI_2013<br>
AEPI_2014<br>
PPIEtel_2013<br>
PPIEtel_2014<br>
NationalHolidays_2013<br>
NationalHolidays_2014<br>
ChulwalarIndex_2013<br>
ChulwalarIndex_2014<br>
Inflation_2013<br>
Inflation_2014<br>
InfluenceNationalHolidaysVector_2013<br>
InfluenceNationalHolidaysVector_2014<br>

####Shorten ModelWithHighCorrelatingIndicators by one year in order to be able to produce a forecast for 2013
ModelWithHighCorrelatingIndicators_2012

####Add "newdata" to the 2013 indicator values for the forecast 
ModelWithHighCorrelatingIndicators_Forecast

####In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point Estimator into a time series
ModelWithHighCorrelatingIndicators_PointForecast

####Comparison with linear regression
ModelWithHighCorrelatingIndicators_forecast_lm<br>
TotalAsIs_2013_lm<br>

####Shorten ModelWithLowCorrelatingIndicators by one year in order to be able to produce a forecast for 2013
ModelWithLowCorrelatingIndicators_2012

####Add "newdata" to the 2013 indicator values for the forecast
ModelWithLowCorrelatingIndicators_Forecast

####In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point Estimator into a time series
ModelWithLowCorrelatingIndicators_PointForecast

####Comparison with linear regression 
ModelWithLowCorrelatingIndicators_forecast_lm<br>
TotalAsIs_2013_lm<br>

####Shorten ModelWithTrendAndSeasonalityOnly by one year in order to be able to produce a forecast for 2013
ModelWithTrendAndSeasonalityOnly_2012 

####Add "newdata" to the 2013 indicator values for the forecast
ModelWithTrendAndSeasonalityOnly_Forecast

####In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point Estimator into a time series
ModelWithTrendAndSeasonalityOnly_PointForecast

####Comparison with linear regression 
ModelWithTrendAndSeasonalityOnly_Forecast_lm<br>
TotalAsIs_2013_lm<br>

####Shorten the variables in Model Total Etel by one year in order to be able to produce a forecast for 2013
ModelTotalEtel_2012

####Forecast
ModelTotalEtel_Forecast

####In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point Estimator into a time series
ModelTotalEtel_PointForecast

####Shorten the variables in Model With Total Urbano Exports by one year in order to be able to produce a forecast for 2013
ModelWithTotalUrbanoExports_2012

####Add "newdata" to the 2013 indicator values for the forecast
ModelWithTotalUrbanoExports_Forecast

####In order to be able to correlate the Forecast with the As Is data, it is necessary to convert the Point Estimator into a time series
ModelWithTotalUrbanoExports_PointForecast

####Shorten the variables in Model With National Holidays by one year in order to be able to produce a forecast for 2013
ModelWithNationalHolidays_2012

####Add "newdata" to the 2013 indicator values for the forecast
ModelWithNationalHolidays_Forecast

####In order to be able to correlate the Forecast with the As Is data, it is necessary to convert the Point Estimator into a time series
ModelWithNationalHolidays_PointForecast

####Shorten the variables in ModelWithInfluenceNationalHolidays by one year in order to be able to produce a forecast for 2013
ModelWithInfluenceNationalHolidays_2012

####Add "newdata" to the 2013 indicator values for the forecast
ModelWithInfluenceNationalHolidays_Forecast

####In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point Estimator into a time series
ModelWithInfluenceNationalHolidays_PointForecast

****************************
<div id='id-section9.0'/>

####Forecast for 2014
Forecast_ModelWithLowCorrelatingIndicators_2014<br>
PointForecast_ModelWithLowCorrelatingIndicators_2014<br>
Forecast_2014<br>
PointForecast_TrendAndSeasonality_2014<br>
Forecast_2014_alternative<br>
PointForecast_2014_alternative<br>

****************************
<div id='id-section10.0'/>

####Simple Exponential Smoothing Model
Model_ses

####Holt Linear Trend Model
Model_holt_1

####Holt Model With Exponential Trend
Model_holt_2

####Dampened Holt Model
Model_holt_3

####Dampened Holt Model with Exponential Trend
Model_holt_4

####Holt-Winters Model
Model_hw_1<br>
Model_hw_2<br>
Model_hw_1_PointForecast<br>
Model_hw_2_PointForecast<br>

####Simple Exponential Smoothing Model
Model_sesEtel

####Holt Linear Trend Model
Model_holt_1Etel

####Holt Model With Exponential Trend
Model_holt_2Etel

####Dampened Holt Model
Model_holt_3Etel

####Dampened Holt Model with Exponential Trend
Model_holt_4Etel

####Holt-Winters Model
Model_hw_1Etel<br>
Model_hw_2Etel<br>
Model_hw_1_PointForecastEtel<br>
Model_hw_2_PointForecastEtel<br>

