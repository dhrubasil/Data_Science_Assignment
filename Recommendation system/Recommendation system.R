#Recommend the best book based on the ratings

library("recommenderlab")
library(caTools)

#Book rating data
Book_rate_data <- read.csv(file.choose())

View(Book_rate_data)
str(Book_rate_data)

hist(Book_rate_data$rating)

#the datatype should be realRatingMatrix inorder to build recommendation engine
Book_rate_data_matrix <- as(Book_rate_data, 'realRatingMatrix')

#Popularity based 

book_recomm_model1 <- Recommender(Book_rate_data_matrix, method="POPULAR")

#Predictions for two users 
recommended_items1 <- predict(Book_rate_data1, Book_rate_data_matrix[413:414], n=5)
as(recommended_items1, "list")


## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering

book_recomm_model2 <- Recommender(Book_rate_data_matrix, method="UBCF")

#Predictions for two users 
recommended_items2 <- predict(Book_rate_data2, Book_rate_data_matrix[413:414], n=5)
as(recommended_items2, "list")