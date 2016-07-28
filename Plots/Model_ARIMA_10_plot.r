#Creates Model_ARIMA_10 plot

png("Plots/Model_ARIMA_10_plot.png")
plot(forecast(Model_ARIMA_10))
dev.off()