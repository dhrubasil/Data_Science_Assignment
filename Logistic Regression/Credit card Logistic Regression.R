#Classify whether application accepted or not using Logistic regression

creditcard<-read.csv(file.choose())
View(creditcard)
creditcard1<-creditcard[,-1]
View(creditcard1)
str(creditcard1)
attach(creditcard1)
#logistic model
logist<-glm(card~reports+age+income+share+expenditure+owner+selfemp+dependents+months+factor(majorcards)+active,family = binomial,data = creditcard1)
summary(logistic)
exp(coef(logist))
table(creditcard1$card)
prob<-predict(logist,type = c("response"),creditcard1)
prob
confusion<-table(prob>0.5,creditcard1$card)
prob1<-prob>0.5
table(prob1)
confusion

# Model Accuracy 
Accuracy<-sum(diag(confusion)/sum(confusion))
Accuracy
Error <- 1-Accuracy
Error

library(ROCR)
rocrpred<-prediction(prob,creditcard1$card)
rocrperf<-performance(rocrpred,'tpr','fpr')
plot(rocrperf,colorize=T,text.adj=c(-0.2,1.7))