#Creates Model_Seasonal_ARIMA_4 plot

png("Plots/Model_Seasonal_ARIMA_4_plot.png")
plot(forecast(Model_Seasonal_ARIMA_4))
dev.off()