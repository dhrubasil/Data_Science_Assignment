#Use decision trees to prepare a model on fraud data 
#Treating those who have taxable_income <= 30000 as "Risky" and others are "Good"

install.packages("C50")  #Package needed for DT
install.packages("tree") #Package for DT
library(caret)           #Package needed for cross tabling
library(C50)             #Package needed for DT

fraud<-read.csv(file.choose()) #Importing data set
View(fraud)
str(fraud)
summary(fraud)

fraudster<-NULL #creating a nulll file
fraudster<-ifelse(fraud$Taxable.Income<=30000,"RISK","GOOD" ) #setting condition as per the bussiness pblm
fraud[,"fraudster"]<-fraudster #amending it with dataset
View(fraud)
fraud$Undergrad<-as.factor(fraud$Undergrad) #converting alpha values to facots from the dataset
fraud$Marital.Status<-as.factor(fraud$Marital.Status)
fraud$Urban<-as.factor(fraud$Urban)
fraud$fraudster<-as.factor(fraud$fraudster)

fraudpart<-createDataPartition(fraud$fraudster,p=.75,list = F) #data partitioning model
train<-fraud[fraudpart,]  #setting train data
test<-fraud[-fraudpart,] #setting test 
table(test$fraudster)
fraudmodel<-C5.0(train[-c(7)],train$fraudster)  #building model 
plot(fraudmodel)
summary(fraudmodel)
pred<-predict.C5.0(fraudmodel,test[-c(7)]) #predicting the outcome
pred

acc<-c() #bagging method
for (i in 1:50) {print (i)
  fraudpart<-createDataPartition(fraud$fraudster,p=.85,list = F)
  train<-fraud[fraudpart,]
  test<-fraud[-fraudpart,]
  fittree <- C5.0(train[,-c(7)], train$fraudster)
  pred <- predict.C5.0(fittree,test[,-c(7)])
  a<-table(test$fraudster,pred)
  acc<-c(acc,sum(diag(a))/sum(a))}
acc #output after bagging

summary(acc) #finding summary of bagging
mean(train$fraudster==predict(fraudmodel,train)) #finding the mean and accuracy
library(gmodels) #library for crosstable
CrossTable(test$fraudster,pred)
confusionMatrix(pred,test$fraudster) #confusion matrix