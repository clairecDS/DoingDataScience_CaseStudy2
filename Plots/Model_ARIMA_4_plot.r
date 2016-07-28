#Creates Model_ARIMA_4 plot

png("Plots/Model_ARIMA_4_plot.png")
plot(forecast(Model_ARIMA_4))
dev.off()