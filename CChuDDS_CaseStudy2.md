# Doing Data Science: Case Study 2
Claire Chu  
July 19, 2016  

#Case Study 2: Forecasting Chulwalar Exports

<br>

#### Introduction

Chulwalar is part of the island group Urbano in the northern hemisphere. They are famous for their plants which flower in winter. There are three main plants that Chulwalar exports: Efak is a leafy bush with white flowers, Wuge is a grass like plant with tiny pink flowers and Etel is a flowering tree. Etel comes in two varieties: red flowers and blue flowers. Due to the nature of the products, exports generally are higher towards the end of the year. Chulwalar celebrates its independence on the 1st of December each year. On this day it is custom to give presents to family and friends. Chulwalar also celebrates the March Equinox as a time of rebirth in the northern hemisphere. 

The Prime Minister of Chulwalar has asked us to help him in forecasting the exports. In order to do this we have been given as is data and plan data as well as a list of indicators which may affect exports. Our job is to find out the best way to forecast Chulwalar's exports in 2014 based on data collected before this year 
<br>

#Table of Contents

****************************
1.0	[Preperation, import and convert data](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

---1.1 [Import the exports data and the indicators](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

---1.2 [Transformation the data into vectors and time series](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

2.0 [Analysis of the basic data](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

---2.1 [Development of the business portfolio](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

---2.2 [Correlation between As Is and Plan data](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

---2.3 [Time series analysis](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

-------2.3.1 ["stl" function](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

-------2.3.2 [Modification of the seasonal componant to a monthly base](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

3.0 [Correlation of different external indicators](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

---3.1 [Definition of the indicators and their correlation with the basic data](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

19.0 [Conclusion and Summary](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

20.0 [Acknowledgements](../clairecDS/DoingDataScience_CaseStudy2/Analysis/)

****************************
<div id='id-section1'/>
###PRELIMINARY STEPS
######Please set up the environment before going through the analysis

```r
setwd("/Users/macnificent/Desktop")

library(fpp)
library(tcltk)
```
######We will use the 'fpp' library for forecasting functions and the 'tcltk' library for the pause function.