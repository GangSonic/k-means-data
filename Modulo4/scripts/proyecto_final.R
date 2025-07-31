#-----------------------------------------------
#MODULO 4 
#-----------------------------------------------
#análisis exploratorio con clustering (k-means) 
#-----------------------------------------------

#Paquetes 
install.packages("rvest")
library(rvest)        # Para scraping web
library(dplyr)        # Para manipulación de datos
library(tidyr)        # Para limpieza de datos
install.packages("purrr")
library(purrr)        # Para mapear y manipular listas
library(stringr)      # Para manipulación de texto
install.packages("factoextra")
library(factoextra)   # Para visualizar los clusters
library(here)

#Cargar data set IRIS 
View(iris)

#Seleccionar columnas a estudiar 
datos <- select(iris,c(1,2,3,4))

# Aplicar k-means para agrupar las flores en 3 clusters
set.seed(123)  # Para reproducibilidad
kmeans_result <- kmeans(datos[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")], centers = 3)

#Visualizacion de centros 
kmeans_result$centers

# Añadir la asignación de clusters al dataset
datos$Cluster <- kmeans_result$cluster


# Visualizar los resultados con fviz_cluster
fviz_cluster(kmeans_result, data = datos[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")],
             geom = "point", ellipse.type = "norm", 
             main = "Visualización de K-means Clustering de Flores (Iris)")
# 5. Guardar el dataset final
write.csv(datos, here("data", "processed", "iris_clusterizado.csv"), row.names = FALSE)


