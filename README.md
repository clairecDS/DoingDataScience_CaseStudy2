# Doing Data Science: Case Study 2
Claire Chu & Joseph Stoffa  
July 19, 2016  

#Case Study 2: Forecasting Chulwalar Exports
#Group Members: Claire Chu & Joseph Stoffa

<br>

####Introduction

Chulwalar is part of the island group Urbano in the northern hemisphere. They are famous for their plants which flower in winter. There are three main plants that Chulwalar exports: Efak is a leafy bush with white flowers, Wuge is a grass like plant with tiny pink flowers and Etel is a flowering tree. Etel comes in two varieties: red flowers and blue flowers. Due to the nature of the products, exports generally are higher towards the end of the year. Chulwalar celebrates its independence on the 1st of December each year. On this day it is custom to give presents to family and friends. Chulwalar also celebrates the March Equinox as a time of rebirth in the northern hemisphere. 

The Prime Minister of Chulwalar has asked us to help him in forecasting the exports. In order to do this we have been given as is data and plan data as well as a list of indicators which may affect exports. Our job is to find out the best way to forecast Chulwalar's exports in 2014 based on data collected before this year 
<br>

####Assignment

Choose one of the flowers from the data provided and complete the following analysis:

- Section the code into modules for importing data, cleaning/modifying data, exploring data, analyzing data

- Add interpretation

- Determine which model is best

- Give a conclusion of your analysis as far as forecasting exports for Chulwalar

For this project, we will be forecasting the "total etel" flower exports for Chulwalar.

#Table of Contents

****************************
1.0	[Preperation, import and convert data](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section1_Prep/Readme.md)

---1.1 [Import the exports data and the indicators](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section1_Prep/Readme.md)

---1.2 [Transformation the data into vectors and time series](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section1_Prep/Readme.md)

2.0 [Analysis of the basic data](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section2_Analysis/readme.md)

---2.1 [Development of the business portfolio](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section2_Analysis/readme.md)

---2.2 [Correlation between As Is and Plan data](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section2_Analysis/readme.md)

---2.3 [Time series analysis](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section2_Analysis/readme.md)

-------2.3.1 ["stl" function](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section2_Analysis/readme.md)

-------2.3.2 [Modification of the seasonal componant to a monthly base](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section2_Analysis/readme.md)

3.0 [Correlation of different external indicators](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section3_Correlation/readme.md)

---3.1 [Definition of the indicators and their correlation with the basic data](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section3_Correlation/readme.md)

---3.2 [Correlation of the indicators with a time offset](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section3_Correlation/readme.md)

---3.3 [Correlation of the indicators with each another](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section3_Correlation/readme.md)

4.0 [Development of forecasting models using tslm()](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section3_Correlation/readme.md)

---4.1 [ModelWithAlllIndicators and with each indicator individually](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section4_tslm/readme.md)

-------4.2.1 [ModelWithHighCorrelatingIndicators](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section4_tslm/readme.md)

-------4.2.2 [ModelWithLowCorrelatingIndicators](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section4_tslm/readme.md)

---4.3 [ModelWithTrendAndSeasonalityOnly](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section4_tslm/readme.md)

---4.4 [ModelWithoutTrendAndSeasonality](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section4_tslm/readme.md)

---4.5 [ModelWithEfakExportsIndicators](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section4_tslm/readme.md)

---4.6 [ModelWithWugeExportsIndicators](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section4_tslm/readme.md)

---4.7 [ModelWithTotalEtel](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section4_tslm/readme.md)

5.0 [Forecasts with the models](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

---5.1 [Shorten the time series in order to test the forecasts](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

---5.2 [Forecasting und testing the models](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

-----------5.2.1.1 [Forecast ModelWithHighCorrelatingIndicators](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

-----------5.2.1.2 [Forecast ModelWithLowCorrelatingIndicators](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

-------5.2.2 [Forecast ModelWithTrendAndSeasonalityOnly](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

-------5.2.3 [Forecast ModelWithEfakExportsIndicators](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

-------5.2.4 [Forecast ModelWithWugeExportsIndicators](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

-------5.2.5 [Forecast ModelTotalEtel](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

-------5.2.6 [Forecast ModelWithTotalUrbanoExports](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

-------5.2.7 [Forecast ModelWithNationalHolidays](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

-------5.2.8 [Forecast ModelWithInfluenceNationalHolidays](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section5_Forecast/readme.md)

6.0 [Forecast for 2014](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section6_Forecast2014/readme.md)

7.0 [Forecasting models with smoothing and related approaches](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section7_AltModel/readme.md)

8.0 [Conclusion and Summary](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section10_Conclusion/readme.md)

11.0 [Acknowledgements](https://github.com/clairecDS/DoingDataScience_CaseStudy2/blob/master/Analysis/Section11_Acknowledgements/readme.md)

****************************
<div id='id-section1'/>
###PRELIMINARY STEPS
######Please set up the environment before going through the analysis

```r
setwd("/Users/macnificent/Desktop")

library(fpp)
library(tcltk)

source('mywait.r')
```

######We will use the 'fpp' library for forecasting functions and the 'tcltk' library to generate the "mywait" function
