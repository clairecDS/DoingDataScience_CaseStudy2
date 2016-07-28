#Creates Model_Seasonal_ARIMA_2 plot

png("Plots/Model_Seasonal_ARIMA_2_plot.png")
plot(forecast(Model_Seasonal_ARIMA_2))
dev.off()