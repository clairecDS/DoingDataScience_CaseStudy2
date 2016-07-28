#This script corrleates indicators
source("Scripts/Utilities/checkFiles.r")

#checks to see if checkFile.csv has been built, checkFile.csv stores when tracked files have been last modified
if(!file.exists("checkFile.csv")) {
  buildFileList("Plots")
}

checkFile <- read.csv("checkFile.csv", stringsAsFactors = FALSE)
checkFile$Date_Modified <- as.POSIXct(checkFile$Date_Modified)

# Monthly Change in Export Price Index (CEPI)
CEPIVector <- c(ImportedIndicators[2:13,2],ImportedIndicators[2:13,3],ImportedIndicators[2:13,4],ImportedIndicators[2:13,5],ImportedIndicators[2:13,6],ImportedIndicators[2:13,7])
CEPI <- ts(CEPIVector , start=c(2008,1), end=c(2013,12), frequency=12)


# checkPlot ensures the plot exists and that it is up to date
if(!checkPlot("./Plots/CEPI_plot")) { #checks to see if plot exists and is up to date
  source("Plots/CEPI_plot.r")
}


# Monthly Satisfaction Index (SI) government based data
SIGovVector <- c(ImportedIndicators[16:27,2],ImportedIndicators[16:27,3],ImportedIndicators[16:27,4],ImportedIndicators[16:27,5],ImportedIndicators[16:27,6],ImportedIndicators[16:27,7])
SIGov <- ts(SIGovVector , start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/SIGov_plot")) { #checks to see if plot exists and is up to date
  source("Plots/SIGov_plot.r")
}


# Average monthly temperatures in Chulwalar
TemperatureVector <- c(ImportedIndicators[30:41,2],ImportedIndicators[30:41,3],ImportedIndicators[30:41,4],ImportedIndicators[30:41,5],ImportedIndicators[30:41,6],ImportedIndicators[30:41,7])
Temperature <- ts(TemperatureVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/Temperature_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Temperature_plot.r")
}


# Monthly births in Chulwalar 
BirthsVector <- c(ImportedIndicators[44:55,2],ImportedIndicators[44:55,3],ImportedIndicators[44:55,4],ImportedIndicators[44:55,5],ImportedIndicators[44:55,6],ImportedIndicators[44:55,7])
Births <- ts(BirthsVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/Births_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Births_plot.r")
}


# Monthly Satisfaction Index (SI) external index 
SIExternVector <- c(ImportedIndicators[58:69,2],ImportedIndicators[58:69,3],ImportedIndicators[58:69,4],ImportedIndicators[58:69,5],ImportedIndicators[58:69,6],ImportedIndicators[58:69,7])
SIExtern <- ts(SIExternVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/SIExtern_plot")) { #checks to see if plot exists and is up to date
  source("Plots/SIExtern_plot.r")
}


# Yearly exports from Urbano
UrbanoExportsVector <- c(ImportedIndicators[72:83,2],ImportedIndicators[72:83,3],ImportedIndicators[72:83,4],ImportedIndicators[72:83,5],ImportedIndicators[72:83,6],ImportedIndicators[72:83,7])
UrbanoExports <- ts(UrbanoExportsVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/UrbanoExports_plot")) { #checks to see if plot exists and is up to date
  source("Plots/UrbanoExports_plot.r")
}


# Yearly number of Globalisation Party members in Chulwalar
GlobalisationPartyMembersVector <- c(ImportedIndicators[86:97,2],ImportedIndicators[86:97,3],ImportedIndicators[86:97,4],ImportedIndicators[86:97,5],ImportedIndicators[86:97,6],ImportedIndicators[86:97,7])
GlobalisationPartyMembers <- ts(GlobalisationPartyMembersVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/GlobalisationPartyMembers_plot")) { #checks to see if plot exists and is up to date
  source("Plots/GlobalisationPartyMembers_plot.r")
}


# Monthly Average Export Price Index for Chulwalar
AEPIVector <- c(ImportedIndicators[100:111,2],ImportedIndicators[100:111,3],ImportedIndicators[100:111,4],ImportedIndicators[100:111,5],ImportedIndicators[100:111,6],ImportedIndicators[100:111,7])
AEPI <- ts(AEPIVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/AEPI_plot")) { #checks to see if plot exists and is up to date
  source("Plots/AEPI_plot.r")
}


# Monthly Producer Price Index (PPI) for Etel in Chulwalar
PPIEtelVector <- c(ImportedIndicators[114:125,2],ImportedIndicators[114:125,3],ImportedIndicators[114:125,4],ImportedIndicators[114:125,5],ImportedIndicators[114:125,6],ImportedIndicators[114:125,7])
PPIEtel <- ts(PPIEtelVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/PPIEtel_plot")) { #checks to see if plot exists and is up to date
  source("Plots/PPIEtel_plot.r")
}


# National Holidays
NationalHolidaysVector <- c(ImportedIndicators[170:181,2],ImportedIndicators[170:181,3],ImportedIndicators[170:181,4],ImportedIndicators[170:181,5],ImportedIndicators[170:181,6],ImportedIndicators[170:181,7])
NationalHolidays <- ts(NationalHolidaysVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/NationalHolidays_plot")) { #checks to see if plot exists and is up to date
  source("Plots/NationalHolidays_plot.r")
}


# Chulwalar Index (Total value of all companies in Chulwalar)
ChulwalarIndexVector <- c(ImportedIndicators[128:139,2],ImportedIndicators[128:139,3],ImportedIndicators[128:139,4],ImportedIndicators[128:139,5],ImportedIndicators[128:139,6],ImportedIndicators[128:139,7])
ChulwalarIndex <- ts(ChulwalarIndexVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/ChulwalarIndex_plot")) { #checks to see if plot exists and is up to date
  source("Plots/ChulwalarIndex_plot.r")
}


# Monthly Inflation rate in Chulwalar 
InflationVector <- c(ImportedIndicators[142:153,2],ImportedIndicators[142:153,3],ImportedIndicators[142:153,4],ImportedIndicators[142:153,5],ImportedIndicators[142:153,6],ImportedIndicators[142:153,7])
Inflation <- ts(InflationVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/Inflation_plot")) { #checks to see if plot exists and is up to date
  source("Plots/Inflation_plot.r")
}


# Proposed spending for Independence day presents
IndependenceDayPresentsVector <- c(ImportedIndicators[156:167,2],ImportedIndicators[156:167,3],ImportedIndicators[156:167,4],ImportedIndicators[156:167,5],ImportedIndicators[156:167,6],ImportedIndicators[156:167,7])
IndependenceDayPresents <- ts(IndependenceDayPresentsVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/IndependenceDayPresents_plot")) { #checks to see if plot exists and is up to date
  source("Plots/IndependenceDayPresents_plot.r")
}


# Influence of National Holidays :
InfluenceNationalHolidaysVector <- c(ImportedIndicators[184:195,2],ImportedIndicators[184:195,3],ImportedIndicators[184:195,4],ImportedIndicators[184:195,5],ImportedIndicators[184:195,6],ImportedIndicators[184:195,7])
InfluenceNationalHolidays <- ts(InfluenceNationalHolidaysVector, start=c(2008,1), end=c(2013,12), frequency=12)

if(!checkPlot("./Plots/InfluenceNationalHolidays_plot")) { #checks to see if plot exists and is up to date
  source("Plots/InfluenceNationalHolidays_plot.r")
}


#4.2
SIExternOffsetByOneMonthVector <- c(ImportedIndicators[57:68,2],ImportedIndicators[57:68,3],ImportedIndicators[57:68,4],ImportedIndicators[57:68,5],ImportedIndicators[57:68,6],ImportedIndicators[57:68,7])
SIExternOffsetByOneMonth <- ts(SIGovVector, start=c(2008,1), end=c(2013,11), frequency=12)

if(!checkPlot("./Plots/SIExternOffsetByOneMonth_plot")) { #checks to see if plot exists and is up to date
  source("Plots/SIExternOffsetByOneMonth_plot.r")
}

# Delete December 2013 from the ts 
TotalAsIsWithoutDec12013 <- ts(TotalAsIsVector , start=c(2008,1), end=c(2013,11), frequency=12)
TotalEtelAsIsWithoutDec12013 <- ts(TotalEtelAsIsVector, start=c(2008,1), end=c(2013,11), frequency=12)
TotalAsIsWithoutDec2013_lm <- lm(TotalAsIsWithoutDec12013 ~ SIExternOffsetByOneMonth, data=TotalAsIsWithoutDec12013)


# Offset SIGov Indicator by two months
SIGovVectorShifted2Months <- c(ImportedIndicators[15:26,2],ImportedIndicators[15:26,3],ImportedIndicators[15:26,4],ImportedIndicators[15:26,5],ImportedIndicators[15:26,6],ImportedIndicators[15:26,7])
SIGovShifted2Months <- ts(SIGovVectorShifted2Months , start=c(2008,1), end=c(2013,10), frequency=12)

if(!checkPlot("./Plots/SIGovShifted2Months_plot")) { #checks to see if plot exists and is up to date
  source("Plots/SIGovShifted2Months_plot.r")
}

# Delete November and December 2013 from the ts

TotalAsIsWithoutNovDec2013 <- ts(TotalAsIsVector , start=c(2008,1), end=c(2013,10), frequency=12)
TotalEtelAsIsWithoutNovDec2013 <- ts(TotalEtelAsIsVector, start=c(2008,1), end=c(2013,10), frequency=12)

TotalAsIsWithoutNovDec2013_lm <- lm(TotalAsIsWithoutNovDec2013 ~ SIGovShifted2Months, data=TotalAsIsWithoutNovDec2013)


#4.3 

IndicatorsMatrix <-cbind(CEPIVector, SIGovVector, TemperatureVector, BirthsVector, SIGovVector, UrbanoExportsVector, GlobalisationPartyMembersVector, AEPIVector, PPIEtel, NationalHolidaysVector, ChulwalarIndexVector, InflationVector, IndependenceDayPresentsVector)

# Establish the standardised data matrix
IndicatorsmatrixStandardised<-scale(IndicatorsMatrix)

# The dimensions of the matrix are determined by the number of indicators.
NumberOfIndicators<-dim(IndicatorsmatrixStandardised)[1]

# Produce the IndicatorsCorrelationCoefficientMatrix.
IndicatorsCorrelationCoefficientMatrix<-(1/(NumberOfIndicators-1))*t(IndicatorsmatrixStandardised)%*%IndicatorsmatrixStandardised

