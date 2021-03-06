suicides = read.csv("suiciderates.csv", header = TRUE, fileEncoding="UTF-8-BOM") #aqui talvez precise de adapta��o
                                                 #a depender do diret�rio do R
library(ggplot2)

#Trocando o nome da coluna de pa�s para um mais simples
colnames(suicides)[which(names(suicides) == "�..country")] <- "country"
#Criando um dataframe s� com o Brasil
brazil <- suicides[suicides$country == 'Brazil',]

#Plotando o boxplot mostrando os suic�dios de homens e mulheres por ano
ggplot(data = brazil) +
  aes(x = sex, y = suicides_no, fill = country.year) +
  geom_boxplot() +
  scale_fill_viridis_d(option  = "inferno") +
  labs(title = "Comparativo",
       x = "Sexo",
       y = "Suic�dios",
       subtitle = "N�mero de suic�dios por sexo por ano",
       fill = "Ano") +
  theme_bw()

#Histograma de frequ�ncia de suic�dios
ggplot(data = brazil) +
  aes(x = suicides_no) +
  geom_histogram(bins = 70, fill = "#35b779") +
  labs(title = "Histograma",
       x = "Suic�dios",
       y = "Frequ�ncia") +
  theme_bw()

#Dispers�o renda per capita x suic�dios/100k
ggplot(data = brazil) +
  aes(x = suicides.100k.pop, y = gdp_per_capita....) +
  geom_point(color = "#000004") +
  geom_smooth(span = 1) +
  labs(title = "Dispers�o",
       x = "Suic�dios/100k habitantes",
       y = "Renda per capita",
       subtitle = "Renda per capita e suic�dios/100 mil habitantes") +
  theme_bw()