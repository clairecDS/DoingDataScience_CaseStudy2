#Creates Model_auto_arima_forecast plot

png("Plots/Model_auto_arima_forecast_plot.png")
plot(Model_auto.arima_forecast)
dev.off()