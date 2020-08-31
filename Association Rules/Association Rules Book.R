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

book<-read.csv(file.choose()) #importing the dataset in csv format
View(book) #the dataset has 
class(book)
book_trans<-as(as.matrix(book),"transactions") #since the data is in binary format, making it as transaction matrix
inspect(book_trans[1:100]) #inspecting the lists first 100

rules<-apriori(as.matrix(book),parameter = list(support=0.002,confidence=0.7)) #creating apriori algorithm with least support and confidence values
inspect(rules[1:20])
plot(rules)

rules1<-apriori(as.matrix(book),parameter = list(support=0.006,confidence=0.9)) #creating apriori algorithm with high support and confidence values
inspect(rules1[1:20])
plot(rules1)

rules2<-apriori(as.matrix(book),parameter = list(support=0.001,confidence=0.1)) #creating apriori algorithm with least support and confidence values and only 10 rules produced when confidence reduced
inspect(rules2[1:10])
plot(rules2)