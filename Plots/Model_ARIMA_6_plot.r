#Creates Model_ARIMA_6 plot

png("Plots/Model_ARIMA_6_plot.png")
plot(forecast(Model_ARIMA_6))
dev.off()