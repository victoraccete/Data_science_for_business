install.packages("lubridate")
library(lubridate)

#dmy("1/2/2007")
#wday(dmy("1/2/2007"), label = TRUE)


# o dataset pode ser encontrado no link do README.md

# a atividade só quer analisar as datas 01/02/2007 e 02/02/2007
# para isso, verificamos em um editor de texto a linha da data inicial
# e calculamos a linha da data final (24 horas x 60 minutos x 2 dias)
consumption <- read.csv("household_power_consumption.txt", header = F, sep = ";", skip = 66637, nrows = 2880)
# para armazenar o cabeçalho e colocar no dataframe
header <- read.csv("household_power_consumption.txt", header = F, sep = ";", nrows=1, as.is = T)
colnames(consumption) = header

# histograma
png("plot1.png")
hist(consumption$Global_active_power, col = "red", 
      xlab = "Global Active Power (killowatts)", main = "Global Active Power")
dev.off()


# timeseries
plot.ts(consumption$Global_active_power, xaxt = "n", xlab = NULL, ylab = "Global Active Power (killowatts)")
axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))
