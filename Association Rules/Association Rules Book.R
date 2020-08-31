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