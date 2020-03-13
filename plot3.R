#setwd("/home/itziar/BesteGauzak/Ikastaroak/JasotakoIkastaroak/ExploratoryDataAnalysisCoursera/Week1/PeerGradedAssignment")

dat <- read.table("/home/itziar/BesteGauzak/Ikastaroak/JasotakoIkastaroak/ExploratoryDataAnalysisCoursera/Week1/datuak/household_power_consumption.txt",
                  header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character", 2), rep("numeric", 7)))
dim(dat)
names(dat)

dat <- transform(dat, Date=as.Date(Date, format="%d/%m/20%y")) # ORAIN BAI!!!
#dat <- transform(dat, Date=as.Date(Date, format="%d/%m/%Y")) # Baliokideak dira
dat$Date[1:10]


dat.short <- subset(dat, (dat$Date >= "2007-02-01") & (dat$Date <= "2007-02-02"))
dim(dat.short) #2880    9
rm(dat)



aux <- format(dat.short$Date, format="%A")
table(aux)
n1 <- 1440
n <- length(aux)



png("plot3.png", width = 480, height = 480)
plot(1:(n+1), c(dat.short$Sub_metering_1, NA), type="l", ylab="Energy sub metering", xlab="", axes=FALSE )
lines(1:(n+1), c(dat.short$Sub_metering_2, NA), col="red")
lines(1:(n+1), c(dat.short$Sub_metering_3, NA), col="blue")
axis(2)
axis(1, at = c(1, n1+1, n+1), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
box(lty = 1)
dev.off()


