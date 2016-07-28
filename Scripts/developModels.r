#This builds forecasting models
source("Scripts/Utilities/checkFiles.r")

#checks to see if checkFile.csv has been built, checkFile.csv stores when tracked files have been last modified
if(!file.exists("checkFile.csv")) {
  buildFileList("Plots")
}

checkFile <- read.csv("checkFile.csv", stringsAsFactors = FALSE)
checkFile$Date_Modified <- as.POSIXct(checkFile$Date_Modified)

#5.1
# All Indiators in one model:
ModelWithAlllIndicators <- tslm(TotalAsIs ~ trend + season + CEPI + SIGov + Temperature + Births + SIExtern + UrbanoExports + GlobalisationPartyMembers + AEPI + PPIEtel + NationalHolidays + ChulwalarIndex + Inflation + IndependenceDayPresents)


# CEPI:
ModelWithCEPI <- tslm(TotalAsIs ~ trend + season + CEPI)


# SIGov:
ModelWithSIGov <- tslm(TotalAsIs ~ trend + season + SIGov)


# Temperature:
ModelWithTemperature <- tslm(TotalAsIs ~ trend + season + Temperature)


# Births:
ModelWithBirths <- tslm(TotalAsIs ~ trend + season + Births)


# SIExtern:
ModelWithSIExtern <- tslm(TotalAsIs ~ trend + season + SIExtern)


# UrbanoExports:
ModelWithTotalUrbanoExports <- tslm(TotalAsIs ~ trend + season + UrbanoExports)


# GlobalisationPartyMembers:
ModelWithGlobalisationPartyMembers <- tslm(TotalAsIs ~ trend + season + GlobalisationPartyMembers)


# AEPI:
ModelWithAEPI <- tslm(TotalAsIs ~ trend + season + AEPI)


# PPIEtel:
ModelWithPPIEtel <- tslm(TotalAsIs ~ trend + season + PPIEtel)


# NationalHolidays:
ModelWithNationalHolidays <- tslm(TotalAsIs ~ trend + season + NationalHolidays)

# ChulwalarIndex:
ModelWithChulwalarIndex <- tslm(TotalAsIs ~ trend + season + ChulwalarIndex)


# Inflation:
ModelWithInflation <- tslm(TotalAsIs ~ trend + season + Inflation)


# IndependenceDayPresents:
ModelWithIndependenceDayPresents <- tslm(TotalAsIs ~ trend + season + IndependenceDayPresents)


# InfluenceNationalHolidays:
ModelWithInfluenceNationalHolidays <- tslm(TotalAsIs ~ trend + season + InfluenceNationalHolidays)
summary(ModelWithInfluenceNationalHolidays)


# In this model only the indicators that correlate well with eachother have been used.  
ModelWithHighCorrelatingIndicators <- tslm(TotalAsIs ~ trend + season + CEPI + SIExtern + UrbanoExports + GlobalisationPartyMembers + AEPI)


# In this model only the indicators that hardly correlate at all with eachother have been used.  
ModelWithLowCorrelatingIndicators <- tslm(TotalAsIs ~ trend + season + NationalHolidays + UrbanoExports + GlobalisationPartyMembers)

# ModelWithTrendAndSeasonalityOnly
ModelWithTrendAndSeasonalityOnly <- tslm(TotalAsIs ~ trend + season)


# ModelWithoutTrendAndSeasonality
ModelWithoutTrendAndSeasonality <- tslm(TotalAsIs ~ CEPI + SIExtern + UrbanoExports + GlobalisationPartyMembers + AEPI)

#ModelTotalEtel
ModelTotalEtel <- tslm(TotalEtelAsIs~ trend + season)

