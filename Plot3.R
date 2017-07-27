# Loading datasets - loading from your local machine
NEI <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/Source_Classification_Code.rds")



# Subset Baltimore city, Maryland == fips (24510)

sub_mary <- subset(NEI, fips=='24510')
sub_mary$year <- factor(sub_mary$year, levels=c('1999', '2002', '2005', '2008'))

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

png(filename="C:/Users/tvaz/Desktop/Coursera/Assignment 2/plot3.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggp <- ggplot(sub_mary,aes(year,Emissions,fill=type)) + geom_bar(stat="identity") + theme_bw() + guides(fill=F)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

dev.off()
