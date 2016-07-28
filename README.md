# Doing Data Science: Case Study 2
Claire Chu & Joseph Stoffa  
July 19, 2016  

#Forecasting Chulwalar Exports
#Group Members: Claire Chu & Joseph Stoffa

<br>

####Introduction

Chulwalar is part of the island group Urbano in the northern hemisphere. They are famous for their plants which flower in winter. There are three main plants that Chulwalar exports: Efak is a leafy bush with white flowers, Wuge is a grass like plant with tiny pink flowers and Etel is a flowering tree. Etel comes in two varieties: red flowers and blue flowers. Due to the nature of the products, exports generally are higher towards the end of the year. Chulwalar celebrates its independence on the 1st of December each year. On this day it is custom to give presents to family and friends. Chulwalar also celebrates the March Equinox as a time of rebirth in the northern hemisphere.
<br>
The Prime Minister of Chulwalar has asked [Wheeler et al] to help him in forecasting the exports. In order to do this [Wheeler et al] were given as is data and plan data as well as a list of indicators which may affect exports. The Wheeler group's job is to find out the best way to forecast Chulwalar's exports in 2014 based on data collected before this year. 
<br>

####Background<br>

This case study builds on the data analysis and modeling of plant exports from Chulwalar performed by Wheeler et al (outlined in Introduction) in order to find the best model to forecast total Etel exports.

#Table of Contents
****************************
1.0 [Preperation, import and convert data for Chulwalar Exports](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Chulwalar_Etel_Exports_Case_Study.rmd)<br>
2.0 [Analysis of the basic data](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Chulwalar_Etel_Exports_Case_Study.rmd)<br>
3.0 [Correlation of different external indicators](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Chulwalar_Etel_Exports_Case_Study.rmd)<br>
4.0 [Development of forecasting models](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Chulwalar_Etel_Exports_Case_Study.rmd)<br>
5.0 [Forecasts with the models](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Chulwalar_Etel_Exports_Case_Study.rmd)<br>
6.0 [Forecast for 2014](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Chulwalar_Etel_Exports_Case_Study.rmd)<br>
7.0 [Forecasting models with smoothing and related approaches](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Chulwalar_Etel_Exports_Case_Study.rmd)<br>
8.0 [Conclusion](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Chulwalar_Etel_Exports_Case_Study.rmd)<br>
9.0 [Acknowledgements](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Chulwalar_Etel_Exports_Case_Study.rmd)<br>
****************************

###Summary<br>
######Based on the completed analysis, it is clear that the best model for the "TotalEtel" forecast is the Holt-Winters model. We can see that the Holt-Winters Multiplicative Model is marginally better than the Additive model. We assume this is the case since this is the only model that takes into account the seasonality changing proportionally to the level of the data. Whereas the Additive model would have been better if the "TotalEtel" seasonality would have been roughly constant throughout the data. The Total Etel exports were found to be highly seasonal so this makes sense. This may be attributed to the Winter blooming flower and the demonstrated correlation between the Total Etel Exports and the Influential National Holidays. Our complete predicted forecast for 2014 Total Etel Exports, based on the Holt-Winters Multiplicative Model, is as follows:<br>
<br>
Model_hw_2_PointForecastEtel<br>
#####          Jan     Feb     Mar     Apr     May     Jun     Jul     Aug
###### 2014 2134821 2018272 1990076 1517542 1384653 1228015 1105178 1401176
#####          Sep     Oct     Nov     Dec
###### 2014 3067063 2547465 2613831 2325692
