#Creates ChulwalarDiff plot

png("Plots/ChulwalarDiff_plot.png")
plot(ChulwalarDiff)
lines(ChulwalarDiff_lag, col="red")
dev.off()