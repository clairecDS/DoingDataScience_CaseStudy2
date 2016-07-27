##This script loads dataframes ImportedAsISData, ImportedIndicators, and ImportedPlanData from ImportedAsIsDataChulwalar.csv, 
##ImportedIndicatorshulwalar.csv, and ImportedPlanDataChulwalar.csv.  All files are located in the "Data" directory.

ImportedAsIsData <- read.csv("Data/ImportedAsIsDataChulwalar.csv", header = FALSE, sep=";", fill = TRUE)

ImportedPlanData <- read.csv("Data/ImportedPlanDataChulwalar.csv", header = FALSE, sep=";", fill = TRUE)

ImportedIndicators <- read.csv("Data/ImportedIndicatorsChulwalar.csv", header = FALSE, sep=";", fill = TRUE)

print("CSV files successfully read.  Dataframes loaded: ", quote = FALSE)
print(ls(), quote = FALSE)