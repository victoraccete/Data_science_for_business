# o dataset pode ser encontrado no link do README.md

# a atividade só quer analisar as datas 01/02/2007 e 02/02/2007
# para isso, verificamos em um editor de texto a linha da data inicial
# e calculamos a linha da data final (24 horas x 60 minutos x 2 dias)
consumption <- read.csv("household_power_consumption.txt", header = F, sep = ";", skip = 66637, nrows = 2880)
# para armazenar o cabeçalho e colocar no dataframe
header <- read.csv("household_power_consumption.txt", header = F, sep = ";", nrows=1, as.is = T)
colnames(consumption) = header

# figura 4
png("plot4.png")
par(mfrow=c(2,2))

plot.ts(consumption$Global_active_power, xaxt = "n", xlab = NULL, ylab = "Global Active Power (killowatts)")
axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))

plot.ts(x = consumption$Voltage, xaxt = "n", xlab = "datetime", ylab = "Voltage")
axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))

plot.ts(x = consumption$Sub_metering_1, col = "black", xaxt = "n", xlab = NULL, ylab = "Energy Sub Metering")
lines(x = consumption$Sub_metering_2, col = "red")
lines(x = consumption$Sub_metering_3, col = "blue")
axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("Black", "Red", "Blue"), pch="_", bty = "n") #bty = "n" para remover a borda da legenda


plot.ts(x = consumption$Global_reactive_power, xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))
dev.off()