## read the data
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

library(ggplot2)

## find the scc codes that are related with coal combustion
scccode = SCC[grep("Vehicles",SCC$EI.Sector),"SCC"]
citydata = subset(NEI, (fips == "24510" | fips == "06037") & SCC %in% scccode)
## add city information
citydata$cityname = "Baltimore City"
citydata[citydata$fips == "06037",]$cityname = "New York City"

png(file="plot6.png",width=640)
g <- ggplot(citydata, aes(x=as.factor(year),y=Emissions)  ) 
g + facet_grid(.~cityname) + geom_bar(stat="identity") + labs(x="") +labs(title="Emission from motor vehicle sources in Baltimore City and New York City")
dev.off()