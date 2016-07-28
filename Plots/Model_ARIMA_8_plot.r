#Creates Model_ARIMA_8 plot

png("Plots/Model_ARIMA_8_plot.png")
plot(forecast(Model_ARIMA_8))
dev.off()