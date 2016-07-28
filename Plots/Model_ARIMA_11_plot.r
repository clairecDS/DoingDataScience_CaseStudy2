#Creates Model_ARIMA_11 plot

png("Plots/Model_ARIMA_11_plot.png")
plot(forecast(Model_ARIMA_11))
dev.off()