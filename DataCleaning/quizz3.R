## set downloading directory 
if(!file.exists("data")){
  dir.create("data")
}

################ Question 1

## download csv file
csvurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" 
csvdestfile = "data/housing_ldaho.csv"
download.file(csvurl, csvdestfile)

## read csv data into workspace
csvdata = read.csv(csvdestfile, header=TRUE, sep=",")
subsets = csvdata[which(csvdata$ACR==3 & csvdata$AGS==6), ]


################ Question 2
library("jpeg")
jpegurl= "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
jpeg = readJPEG(readBin(jpegurl, "raw", 1e6), native=TRUE)
qtl = quantile(jpeg, probs=c(0.3,0.8))


################ Question 3
csvurl1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
csvdest1 = "data/GDP.csv"
download.file(csvurl1, csvdest1)
csvurl2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
csvdest2 = "data/educational.csv"
download.file(csvurl2, csvdest2)
gdp = read.csv(csvdest1, header=TRUE, skip=4, nrows = 190, sep=",", 
               col.names=c("CountryCode","Ranking","","Economy","Dollars","Note","","","",""))
gdp = gdp[,c(1,2,4,5,6)]
edu = read.csv(csvdest2, header=TRUE, sep=",")
## match them based on country shortcode
merged = merge(gdp, edu, by="CountryCode",all=FALSE)
ans = merged[order(merged$Ranking, decreasing=TRUE)[13], ]

############### Question 4
tapply(merged$Ranking, merged$Income.Group, mean)

############### Question 5
merged$cate = cut(merged$Ranking, 
                  breaks=quantile(merged$Ranking, probs = seq(0, 1, 0.2)))
table(merged$cate,merged$Income.Group)
