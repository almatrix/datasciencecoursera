## read the data
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")
library(ggplot2)

## find the scc codes that are related with coal combustion
scccode = SCC[grep("Coal",SCC$EI.Sector),"SCC"]

png(file="plot4.png")
g <- ggplot(subset(NEI, SCC %in% scccode), aes(x=as.factor(year),y=Emissions)  ) 
g + geom_bar(stat="identity") + labs(x="") + labs(title="Emission from coal combustion-related sources")
dev.off()