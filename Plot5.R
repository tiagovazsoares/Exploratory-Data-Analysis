# Loading datasets - loading from your local machine
NEI <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/Source_Classification_Code.rds")

# Search for matching argument "vehicle" in the data set SCC 

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data to Baltimore's fip
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]

png(filename="C:/Users/tvaz/Desktop/Coursera/Assignment 2/plot5.png", width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) + 
  geom_bar(stat="identity",fill="grey",width=0.75) + 
  theme_bw() +  guides(fill=FALSE) + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +  
  labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions in Baltimore (1999-2008)"))

dev.off()

