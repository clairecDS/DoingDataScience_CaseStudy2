#Creates Model_ARIMA_5 plot

png("Plots/Model_ARIMA_5_plot.png")
plot(forecast(Model_ARIMA_5))
dev.off()