suicides = read.csv("suiciderates.csv", header = TRUE, fileEncoding="UTF-8-BOM") #aqui talvez precise de adaptação
                                                 #a depender do diretório do R
library(ggplot2)

#Trocando o nome da coluna de país para um mais simples
colnames(suicides)[which(names(suicides) == "ï..country")] <- "country"
#Criando um dataframe só com o Brasil
brazil <- suicides[suicides$country == 'Brazil',]

#Plotando o boxplot mostrando os suicídios de homens e mulheres por ano
ggplot(data = brazil) +
  aes(x = sex, y = suicides_no, fill = country.year) +
  geom_boxplot() +
  scale_fill_viridis_d(option  = "inferno") +
  labs(title = "Comparativo",
       x = "Sexo",
       y = "Suicídios",
       subtitle = "Número de suicídios por sexo por ano",
       fill = "Ano") +
  theme_bw()

#Histograma de frequência de suicídios
ggplot(data = brazil) +
  aes(x = suicides_no) +
  geom_histogram(bins = 70, fill = "#35b779") +
  labs(title = "Histograma",
       x = "Suicídios",
       y = "Frequência") +
  theme_bw()

#Dispersão renda per capita x suicídios/100k
ggplot(data = brazil) +
  aes(x = suicides.100k.pop, y = gdp_per_capita....) +
  geom_point(color = "#000004") +
  geom_smooth(span = 1) +
  labs(title = "Dispersão",
       x = "Suicídios/100k habitantes",
       y = "Renda per capita",
       subtitle = "Renda per capita e suicídios/100 mil habitantes") +
  theme_bw()