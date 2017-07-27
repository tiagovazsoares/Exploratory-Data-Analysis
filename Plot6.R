# Loading datasets - loading from your local machine
NEI <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/Source_Classification_Code.rds")

# Gather the subset of the SCC data which corresponds to vehicle
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data to Baltimore's fip
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
baltimoreVehiclesNEI$city <- "Baltimore"
californiaVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
californiaVehiclesNEI$city <- "California"

# Combine the 2 dataframes with each city name into a single dataset

NEI_cities <- rbind(californiaVehiclesNEI,baltimoreVehiclesNEI)
NEI_cities$city <- factor(NEI_cities$city)

library(ggplot2)

png(filename="C:/Users/tvaz/Desktop/Coursera/Assignment 2/plot6.png",width=640,height=480,units="px",bg="transparent")

ggplot(NEI_cities, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions in Baltimore & Los Angeles between 1999-2008"))

dev.off()
