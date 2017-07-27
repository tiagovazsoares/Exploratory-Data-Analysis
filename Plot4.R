# Loading datasets - loading from your local machine
NEI <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/tvaz/Desktop/Coursera/Assignment 2/Source_Classification_Code.rds")

# Search for matching argument "coal" in the data set SCC 
SCC_coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge_scc_nei <- merge(x=NEI, y=SCC_coal, by='SCC')
sum_scc_nei <- aggregate(merge_scc_nei [, 'Emissions'], by=list(merge_scc_nei$year), sum)
colnames(sum_scc_nei) <- c('Year', 'Emissions')

# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?

# Generate the graph in the same directory as the source code
png(filename="C:/Users/tvaz/Desktop/Coursera/Assignment 2/plot4.png", width=480,height=480, units="px",bg="transparent")

library(ggplot2)

ggplot(data=sum_scc_nei, aes(x=Year, y=Emissions/1000)) + 
  geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle(expression('Total Emissions of PM'[2.5])) + 
  ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
  theme(legend.position='none') + scale_colour_gradient(low='black', high='red')

dev.off()
