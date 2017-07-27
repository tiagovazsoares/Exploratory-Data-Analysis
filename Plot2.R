# Loading datasets - loading from your local machine
NEI <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/Source_Classification_Code.rds")

# Subset NEI with the fips code for Maryland and store in a new data frame called sub_mary

sub_mary <- subset(NEI, fips=='24510')

baltimore <- aggregate(Emissions ~ year, sub_mary, sum)

png(filename="C:/Users/tvaz/Desktop/Coursera/Assignment 2/plot2.png", width=480,height=480, units="px",bg="transparent")

barplot(baltimore$Emissions, names.arg=baltimore$year,
        main=expression('Total Emission of PM'[2.5]),
        xlab="Year",ylab="PM2.5 Emissions (Tons)")
       

dev.off()
