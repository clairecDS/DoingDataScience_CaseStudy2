#This script splits the data frames into individual vectors and converts the vectors into time series so that they can be
#analyzed.


#Split dataframes into individual vectors
TotalAsIsVector <- c(ImportedAsIsData [2:13,2],ImportedAsIsData [2:13,3],ImportedAsIsData [2:13,4],ImportedAsIsData [2:13,5],ImportedAsIsData [2:13,6],ImportedAsIsData [2:13,7])

TotalEtelAsIsVector <- c(ImportedAsIsData [44:55,2],ImportedAsIsData [44:55,3],ImportedAsIsData [44:55,4],ImportedAsIsData [44:55,5],ImportedAsIsData [44:55,6],ImportedAsIsData [44:55,7])

YearAsIsVector <- c(ImportedAsIsData [86,2],ImportedAsIsData [86,3],ImportedAsIsData [86,4],ImportedAsIsData [86,5],ImportedAsIsData [86,6],ImportedAsIsData [86,7])

TotalAsIsVector_2014 <- c(ImportedAsIsData[2:13,8])

PlanVector <- c(ImportedPlanData[2:13,2],ImportedPlanData[2:13,3],ImportedPlanData[2:13,4],ImportedPlanData[2:13,5],ImportedPlanData[2:13,6],ImportedPlanData[2:13,7])

TotalEtelPlanVector <- c(ImportedPlanData[44:55,2],ImportedPlanData[44:55,3],ImportedPlanData[44:55,4],ImportedPlanData[44:55,5],ImportedPlanData[44:55,6],ImportedPlanData[44:55,7])

YearPlanVector <- c(ImportedPlanData[86,2],ImportedPlanData[86,3],ImportedPlanData[86,4],ImportedPlanData[86,5],ImportedPlanData[86,6],ImportedPlanData[86,7])

PlanVector_2014 <- c(ImportedPlanData[2:13,8])

#Convert vectors into time series objects
TotalAsIs<- ts(TotalAsIsVector , start=c(2008,1), end=c(2013,12), frequency=12)

TotalEtelAsIs<- ts(TotalEtelAsIsVector, start=c(2008,1), end=c(2013,12), frequency=12)

YearAsIs <- ts(YearAsIsVector, start=c(2008,1), end=c(2013,12), frequency=12)

TotalAsIs_2014 <- ts(TotalAsIsVector_2014, start=c(2014,1), end=c(2014,12), frequency=12)

TotalPlan <- ts(PlanVector , start=c(2008,1), end=c(2013,12), frequency=12)

TotalEtelPlan <- ts(TotalEtelPlanVector, start=c(2008,1), end=c(2013,12), frequency=12)

YearPlan <- ts(YearPlanVector, start=c(2008,1), end=c(2013,12), frequency=12)

TotalPlan_2014 <- ts(PlanVector_2014, start=c(2014,1), end=c(2014,12), frequency=12)

#Call up time series to check everything has worked.
print("TotalAsIs: ", quote = FALSE)
print(TotalAsIs)
print("", quote = FALSE)
print("TotalEtelAsIs: ", quote = FALSE)
print(TotalEtelAsIs)
print("", quote = FALSE)
print("YearAsIs: ", quote = FALSE)
print(YearAsIs)
print("", quote = FALSE)
print("TotalAsIs_2014: ", quote = FALSE)
print(TotalAsIs_2014)
print("", quote = FALSE)
print("TotalPlan: ", quote = FALSE)
print(TotalPlan)
print("", quote = FALSE)
print("TotalEtelPlan: ", quote = FALSE)
print(TotalEtelPlan)
print("", quote = FALSE)
print("YearPlan: ", quote = FALSE)
print(YearPlan)
print("", quote = FALSE)
print("TotalPlan_2014: ", quote = FALSE)
print(TotalPlan_2014)
