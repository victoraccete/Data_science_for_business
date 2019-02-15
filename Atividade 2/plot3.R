# o dataset pode ser encontrado no link do README.md

# a atividade só quer analisar as datas 01/02/2007 e 02/02/2007
# para isso, verificamos em um editor de texto a linha da data inicial
# e calculamos a linha da data final (24 horas x 60 minutos x 2 dias)
consumption <- read.csv("household_power_consumption.txt", header = F, sep = ";", skip = 66637, nrows = 2880)
# para armazenar o cabeçalho e colocar no dataframe
header <- read.csv("household_power_consumption.txt", header = F, sep = ";", nrows=1, as.is = T)
colnames(consumption) = header

# figura 3
png("plot3.png")
plot.ts(x = consumption$Sub_metering_1, col = "black", xaxt = "n", xlab = NULL, ylab = "Energy Sub Metering")
lines(x = consumption$Sub_metering_2, col = "red")
lines(x = consumption$Sub_metering_3, col = "blue")
axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("Black", "Red", "Blue"), pch="_")
dev.off()