#Consider only the below columns and prepare a prediction model for predicting Price

a <- read.csv(file.choose())

attach(a)

corolla <- a[c("Price","Age_08_04","KM","HP","cc","Doors","Gears","Quarterly_Tax","Weight")]
View(corolla)
summary(corolla)
attach(corolla)
plot(corolla)
cor(corolla)

model <- lm(Price~., data = corolla)
summary(model)
library(car)
library(carData)

#influence.measures(model)
influenceIndexPlot(model)
influencePlot(model)
vif(model)
model2 <- lm(Price~., data = corolla[-c(81,222,961),])
summary(model2)

library(MASS)
stepAIC(model)

avPlots(model)

model3 <- lm(Price ~ Age_08_04 + KM + HP + Gears + Quarterly_Tax + Weight, data =corolla[-c(81,222,961),])
summary(model3)

plot(model2)