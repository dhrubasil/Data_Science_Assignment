#Prepare a prediction model for profit of 50_startups data.

dataset <- read.csv(file.choose())
View(dataset)


# Converting categorical variable to factors

dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# What are LR assumptions

#1. Linearity
#2. Homoskedisity
#3. Multicollinearity

# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ .,
               data = training_set)


# Checking VIF for multicollinearity, Linearity and Homoskedicity from Residuals vs Fitted graph

par(mfrow=c(2,2))
plot(regressor)   # We see that the Linearity exists and Homoskedacity is present

library(car)

vif(regressor) # VIF for each var<4, no multicollinearity , Thus we conclude that assumptions hold true

# Check output of regression

summary(regressor) # With all in, Adjusted R- sq is 0.9425, Also at sig level 0.05, state is not significant, removing state var

# Backward Elimination

# First iteration (remove State)

regressor = lm(formula = Profit ~ `R.D.Spend` + Administration + `Marketing.Spend`,
               data = training_set)

summary(regressor)

# Second iteration (Remove administration)

regressor = lm(formula = Profit ~ `R.D.Spend` + `Marketing.Spend`,
               data = training_set)

summary(regressor)

# Third iteration (Remove Marketing spend)

regressor <- lm(formula = Profit ~ `R.D.Spend`,
                data = training_set)

summary(regressor)

# We will consider Marketing spend in the model since it is very close to the significance level of 0.05 as well including it increases the R- Sqaured

# Final

regressor = lm(formula = Profit ~ `R.D.Spend` + `Marketing.Spend`,
               data = training_set)

summary(regressor)

y_pred = predict(regressor, newdata = test_set)

y_pred

test_set$Profit

plot(y_pred, test_set$Profit)