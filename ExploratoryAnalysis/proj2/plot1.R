## read the data
NEI <- readRDS("data/summarySCC_PM25.rds")

## total emission of years 1999,2002,2005 and 2008
png(file="plot1.png")
barplot(xtabs(Emissions ~ year, NEI), 
        main="Total Emission of Each Year")
dev.off()