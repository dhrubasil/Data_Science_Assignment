#Perform Clustering for the crime data and identify the number of clusters formed and draw inferences.

crime_data <- read.csv(file.choose())
View(crime_data)

library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # for comparing two dendrograms

df <- crime_data
df <- na.omit(df)
df <- scale(df)
head(df)

# Dissimilarity matrix
d <- dist(df, method = "euclidean")

# Hierarchical clustering using Complete Linkage
hc1 <- hclust(d, method = "complete" )

# Plot the obtained dendrogram
plot(hc1, cex = 0.6, hang = -1)