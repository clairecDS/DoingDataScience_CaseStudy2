#Creates seasonal plots for stl

png("Plots/STL_TimeSeries_seasonal.png")
par(mfrow=c(2,1))
monthplot(TotalAsIs_stl$time.series[,"seasonal"], main="TotalAsIs_stl", ylab="Seasonal")
monthplot(TotalEtelAsIs_stl$time.series[,"seasonal"], main="TotalEtelAsIs_stl", ylab="Seasonal")
dev.off()