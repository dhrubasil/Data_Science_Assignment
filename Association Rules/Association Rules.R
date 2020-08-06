#Prepare rules for the all the data sets 
#1) Try different values of support and confidence. Observe the change in number of rules for different support, confidence values
#2) Change the minimum length in apriori algorithm
#3) Visualize the obtained rules using different plots 

# Association Rules

install.packages("rmarkdown")
install.packages("arules")
install.packages("arulesViz")

library(arules)
library(arulesViz)

#Implementation on book dataset

book <- read.csv(file.choose())

View(book)

book_rules <- apriori(book,parameter=list(support=0.2, confidence = 0.5,minlen=5))

plot(book_rules,method = "scatterplot")
plot(book_rules,method = "grouped")
plot(book_rules,method = "graph")
plot(book_rules,method = "mosaic")

#Implementation on groceries dataset

groceries <- read.csv(file.choose())

View(groceries)

groceries_rules <- apriori(groceries,parameter = list(support = 0.002,confidence = 0.05,minlen=3))

plot(groceries_rules,method = "scatterplot")
plot(groceries_rules,method = "grouped")
plot(groceries_rules,method = "graph")
plot(groceries_rules,method = "mosaic")

#Implementation on groceries dataset

my_movies <- read.csv(file.choose())

View(my_movies)

my_movies_rules <- apriori(my_movies,parameter=list(support=0.2, confidence = 0.5,minlen=5))

plot(my_movies_rules,method = "scatterplot")
plot(my_movies_rules,method = "grouped")
plot(my_movies_rules,method = "graph")
plot(my_movies_rules,method = "mosaic")

