#Creates Model_ARIMA_13 plot

png("Plots/Model_ARIMA_13_plot.png")
plot(forecast(Model_ARIMA_13))
dev.off()