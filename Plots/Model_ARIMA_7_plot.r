#Creates Model_ARIMA_7 plot

png("Plots/Model_ARIMA_7_plot.png")
plot(forecast(Model_ARIMA_7))
dev.off()