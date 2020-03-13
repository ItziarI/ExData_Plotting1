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


png("plot1.png", width = 480, height = 480)
hist(dat.short$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()

