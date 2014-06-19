## read the data
NEI <- readRDS("data/summarySCC_PM25.rds")

library(ggplot2)
png(file="plot3.png",width=640)
g <- ggplot(subset(NEI,fips == "24510"), aes(x=as.factor(year),y=Emissions)  ) 
g + facet_grid(.~type) + geom_bar(stat="identity") + labs(x="") +labs(title="Emission from differnt type of sources in Baltimore City")

dev.off()