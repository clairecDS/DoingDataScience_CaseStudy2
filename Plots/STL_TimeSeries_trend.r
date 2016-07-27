#Creates trend plots for stl

png("Plots/STL_TimeSeries_trend.png")
par(mfrow=c(2,1))
plot(TotalAsIs_stl$time.series[,"trend"], col="black")
plot(TotalEtelAsIs_stl$time.series[,"trend"], col="green")
dev.off()