#Perform Basic Visualizations for all the columns(numerical data only) on any 
#Data set from data set folder make sure it has more data. So we can make better inferences for the visualizations(Boxplot,histogram)

#Box plot for the Cars dataset

Cars <- read.csv(file.choose())
View(Cars)
input_cars <- Cars[,c('MPG','WT')]
print(head(input_cars))
boxplot(MPG ~ WT, data = Cars, xlab = "WT", ylab = "MPG", main = "Mileage Data")

#Histogram plot for the computer dataset

Computer_Data <- read.csv(file.choose())
View(Computer_Data)
input_computer <- Computer_Data[,c('price','speed')]
print(head(input_computer))
hist(input_computer[,c('speed')],xlab = "price",col = "Blue",border = "Black")
