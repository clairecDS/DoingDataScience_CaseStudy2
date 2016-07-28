#Creates Model_ARIMA_3 plot

png("Plots/Model_ARIMA_3_plot.png")
plot(forecast(Model_ARIMA_3))
dev.off()