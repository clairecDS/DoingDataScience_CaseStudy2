#Creates Model_ARIMA_9 plot

png("Plots/Model_ARIMA_9_plot.png")
plot(forecast(Model_ARIMA_9))
dev.off()