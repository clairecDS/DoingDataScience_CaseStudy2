#Creates Model_ARIMA_1 plot

png("Plots/Model_ARIMA_1_plot.png")
plot(forecast(Model_ARIMA_1))
dev.off()