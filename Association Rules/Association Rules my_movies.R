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


#Implementation on my movies dataset

movie <- read.csv(file.choose())

View(movie)

movie1<-movie[,6:15] #removing the non numeric coloumns and choosing numerics
View(movie1)
class(movie1)
movietrans<-as(as.matrix(movie1),"transactions") #converting the given data to matrix format
inspect(movietrans[1:10])#inspecting the lists in the matrix

rule<-apriori(as.matrix(movie1),parameter =list (support=0.001,confidence=0.03))#builidng apriori algorith and first ruleset
inspect(rule[1:10])#inspecting the lists in the new rule
plot(rule)

rule1<-apriori(as.matrix(movie1),parameter =list (support=0.003,confidence=0.06)) #builidng my model with different set of support and confidence values
inspect(rule1[1:10])#inspecting the lists in the new rule
plot(rule1)

rule2<-apriori(as.matrix(movie1),parameter =list (support=0.02,confidence=0.03))#another model with high support value
inspect(rule2[1:10])#inspecting the lists in the new rule
plot(rule2)