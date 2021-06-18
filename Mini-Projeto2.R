# mini-Projeto 2

# limpeza e Transformação de Dados com Power Query e Linguagem R

#definindo a pasta de trabalho
#substitua o caminho pela sua pasta local
setwd("C:/Users/rube/iCloudDrive/Data Science/PowerBI/Cap12/Mini Projeto 2")
getwd()


#pacotes
install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")


#carregar pacotes
library(dplyr)
library(data.table)
library(ggplot2)


#fonte de dados
dados_iris <- iris
View(dados_iris)


#EXEC 1 - Sumarizar os dados com as médias de cada coluna de um dataset
library(dplyr)
media_iris <- summarize(group_by(dados_iris, Species),
                        media_sepal_length = mean(Sepal.Length),
                        media_sepal_width = mean(Sepal.Width),
                        media_petal_length = mean(Petal.Length),
                        media_petal_width = mean(Petal.Width)

View(media_iris)


#EXEC 2 - Extrair o valor inteiro de uma das colunas decimais
library(data.table)

dados_iris_id <- data.table(dados_iris)
View(dados_iris_id)
dados_iris_id$Sepal.Length <- as.integer(dados_iris_id$Sepal.Length)
View(dados_iris_id)


# para executar no Power Query
library(data.table)
dados_iris_id <- data.table(dados_iris)
dados_iris_id$Sepal.Length <- as.integer(dados_iris_id$Sepal.Length)


#EXEC 3 - Construir um gráfico mostrando a relação de duas variáveis numéricas para 3 categorias
library(ggplot2)
ggplot(data = dados_iris, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point(aes(color = Species), size = 3) +
  ggtitle("Largura e Comprimento das Pétalas") +
  labs(x = "Largura da Pétala",
        y = "Comprimento da Pétala") +
  theme_bw() +
  theme(title = element_text(size = 15, color = "orange"))
