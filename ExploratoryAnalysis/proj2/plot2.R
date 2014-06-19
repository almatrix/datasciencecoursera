## read the data
NEI <- readRDS("data/summarySCC_PM25.rds")

## total emission in Baltimore of years 1999,2002,2005 and 2008
png(file="plot2.png")
barplot(xtabs(Emissions ~ year, subset(NEI,fips == "24510")), 
        main="Total Emission in Baltimore City")
dev.off()