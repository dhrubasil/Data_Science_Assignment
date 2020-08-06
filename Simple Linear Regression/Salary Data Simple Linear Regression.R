#Salary_hike -> Build a prediction model for Salary_hike

Salary_hike <- read.csv(file.choose())

summary(Salary_hike)

# Variance and Standard deviation of Salary_hike column
var(Salary_hike$YearsExperience)

sd(Salary_hike$YearsExperience)

# Variance and Standard deviation of Churn_out_rate column
var(Salary_hike$Salary)

sd(Salary_hike$Salary)

Salary_hike_Model <- lm(Salary ~ YearsExperience, data = Salary_hike)
summary(Salary_hike_Model)

plot(Salary_hike_Model)