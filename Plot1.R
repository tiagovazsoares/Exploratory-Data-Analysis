# Loading datasets - loading from your local machine
NEI <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/Source_Classification_Code.rds")

# From the NEI data frame we'll aggregate the sum of the total Emissions (variable) by year and round it 2 digits.

total_emissions <- aggregate(Emissions ~ year, NEI, sum)
total_emissions$round <- round(total_emissions[,2]/1000,2)


# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

# create the png file "Plot1.png" in the same directory as the source code


png(filename="C:/Users/tvaz/Desktop/Coursera/Assignment 2/plot1.png", width=480,height=480, units="px",bg="transparent")

barplot(total_emissions$round, names.arg=total_emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', 
        ylab=expression (paste('PM', ''[2.5], ' in Kilotons')))

dev.off()
