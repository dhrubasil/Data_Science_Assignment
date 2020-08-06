library(factoextra)
library(cluster)
library(fpc)
library(NbClust)

winedf<-read.csv(file.choose())
View(winedf)
summary(winedf)

W.pca <- princomp(winedf[,-1], cor = TRUE, scores = TRUE, covmat = NULL)
summary(W.pca)

plot(W.pca)
biplot(W.pca)
no_of_Clusters = NbClust(winedf, distance = "euclidean", min.nc = 2, max.nc = 10, method = "complete", index ="all")

# Plot bar chart for the clusters
fviz_nbclust(no_of_Clusters) + theme_minimal()

hclust.complete = eclust(winedf, "hclust", k = 7, method = "complete", graph = FALSE) 
fviz_dend(hclust.complete, rect = TRUE, show_labels = FALSE)

km.7 = eclust(winedf, "kmeans", k = 5, nstart = 25, graph = FALSE)
fviz_cluster(km.7, geom = "point", frame.type = "norm")

winedf.pca = winedf[,2:14]
no_of_Clusters = NbClust(winedf.pca, distance = "euclidean", min.nc = 2, max.nc = 10, method = "complete", index ="all")

# Plot bar chart for the clusters
fviz_nbclust(no_of_Clusters) + theme_minimal()

hclust.complete = eclust(winedf.pca, "hclust", k = 7, method = "complete", graph = FALSE) 
fviz_dend(hclust.complete, rect = TRUE, show_labels = FALSE) 

km.7 = eclust(winedf.pca, "kmeans", k = 5, nstart = 25, graph = FALSE)
fviz_cluster(km.7, geom = "point", frame.type = "norm")