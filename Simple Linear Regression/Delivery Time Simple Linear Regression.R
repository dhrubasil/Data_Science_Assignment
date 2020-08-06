#Delivery_time -> Predict delivery time using sorting time

delivery_time <- read.csv(file.choose())

summary(delivery_time)

# Variance and Standard deviation of Delivery.Time column
var(delivery_time$Delivery.Time)

sd(delivery_time$Delivery.Time)

# Variance and Standard deviation of Sorting.Time column
var(delivery_time$Sorting.Time)

sd(delivery_time$Sorting.Time)

deliverTimeModel <- lm(Delivery.Time ~ Sorting.Time, data = delivery_time)
summary(deliverTimeModel)

plot(deliverTimeModel)

library(mvinfluence)

influenceIndexPlot(deliverTimeModel)

deliverTimeModel <- lm(Delivery.Time ~ Sorting.Time, data = delivery_time[c(-5,-9,-21),])
summary(deliverTimeModel)

plot(deliverTimeModel)