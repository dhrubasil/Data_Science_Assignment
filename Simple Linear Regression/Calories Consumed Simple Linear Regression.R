#Calories_consumed -> predict weight gained using calories consumed

Calories_consumed <- read.csv(file.choose()) #choosing the dataset

summary(Calories_consumed)

# Variance and Standard deviation of Calories.Consumed column
var(Calories_consumed$Calories.Consumed)

sd(Calories_consumed$Calories.Consumed)

# Variance and Standard deviation of Weight.gained..grams. column
var(Calories_consumed$Weight.gained..grams.)

sd(Calories_consumed$Weight.gained..grams.)

WeightGainModel <- lm(Weight.gained..grams. ~ Calories.Consumed, data = Calories_consumed)
summary(WeightGainModel)

plot(Calories_consumed)