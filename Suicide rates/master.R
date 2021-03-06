install.packages("lubridate")
install.packages("tidyverse")
install.packages("psych")

library(ggplot2)
library(lubridate)
library(psych)
library(tidyverse)
options(scipen=999) # Desliga a nota��o cient�fica
#ALTERAR DE ACORDO COM A NECESSIDADE
suicides = read.csv("C:/Users/Victor/Documents/Data_science_for_business/Suicide rates/master.csv", header = TRUE)

#Trocando o nome da coluna de pa?s para um mais simples
colnames(suicides)[which(names(suicides) == "�..country")] <- "country"
#Criando um dataframe s? com o Brasil
brazil <- suicides[suicides$country == 'Brazil',]

#Histograma de frequ?ncia de suic?dios
ggplot(data = brazil) +
  aes(x = suicides_no) +
  geom_histogram(bins = 70, fill = "#35b779") +
  labs(title = "Histograma",
       x = "Suic?dios",
       y = "Frequ?ncia") +
  theme_bw()

#Dispers?o renda per capita x suic?dios/100k
ggplot(data = brazil) +
  aes(x = suicides.100k.pop, y = gdp_per_capita....) +
  geom_point(color = "#000004") +
  geom_smooth(span = 1) +
  labs(title = "Dispers?o",
       x = "Suic?dios/100k habitantes",
       y = "Renda per capita",
       subtitle = "Renda per capita e suic?dios/100 mil habitantes") +
  theme_bw()

#Pergunta 1 e 2 
suicides %>% 
  filter(country=='Brazil') %>% 
  ggplot(.,aes(x = as.character(year), y = suicides.100k.pop, fill = age, 
               group=age, colour=age)) + 
  geom_line() + 
  geom_point() + ylim(0,25) + facet_grid(~sex)

#Pergunta 3
corr.test(brazil$gdp_per_capita...., brazil$suicides_no, 
          method = "pearson")

corr.test(suicides$gdp_per_capita...., suicides$suicides_no, 
          method = "pearson")

# Pergunta 4
#Plotando o boxplot mostrando os suic?dios de homens e mulheres por ano
ggplot(data = brazil) +
  aes(x = sex, y = suicides.100k.pop, fill = country.year) +
  geom_boxplot() +
  scale_fill_viridis_d(option  = "inferno") +
  labs(title = "Comparativo",
       x = "Sexo",
       y = "Suicidios",
       subtitle = "Numero de suicidios por sexo por ano",
       fill = "Ano") +
  theme_bw()

# Criando os subsets agrupando informa��es entre os anos
suicide_count_per_sex <- aggregate(x=suicides$suicides_no, by=list(sex=suicides$sex), FUN=sum)
grouped <- aggregate(x=suicides$suicides_no, 
                     by=list(sex=suicides$sex, country=suicides$country), FUN=sum)

ggplot(data = suicide_count_per_sex) +
  aes(x = sex, weight = x) +
  geom_bar(fill = "#0c4c8a") +
  labs(title = "Comparativo Masculino x Feminino",
       x = "Sexo",
       y = "N�mero de suic�dios",
       subtitle = "Durante todos os anos, entre todos os pa�ses") +
  theme_minimal()

ggplot(data = grouped) +
  aes(x = country, fill = sex, weight = x) +
  geom_bar(position = "fill") +
  scale_fill_viridis_d(option  = "plasma") +
  labs(title = "Comparativo masculino x feminino",
       x = "Pa�ses",
       y = "Comparativo",
       subtitle = "Entre todos os pa�ses") +
  theme(axis.text.x=element_blank())