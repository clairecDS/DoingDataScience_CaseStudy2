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
1.0 [Preperation, import and convert data for Chulwalar Exports]
2.0 [Analysis of the basic data]
3.0 [Correlation of different external indicators]
4.0 [Development of forecasting models]
5.0 [Forecasts with the models]
6.0 [Forecast for 2014]
7.0 [Forecasting models with smoothing and related approaches]
8.0 [Conclusion]
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
