#Perform clustering (Both hierarchical and K means clustering) for the airlines data to obtain optimum number of clusters. 
#Draw the inferences from the clusters obtained.

library("readxl")
EastWestAirlines <- read_xlsx(file.choose())
View(EastWestAirlines)

library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # for comparing two dendrograms

df <- EastWestAirlines
df <- na.omit(df)
df <- scale(df)
head(df)