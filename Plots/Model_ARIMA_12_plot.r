#Creates Model_ARIMA_12 plot

png("Plots/Model_ARIMA_12_plot.png")
plot(forecast(Model_ARIMA_12))
dev.off()