## set downloading directory 
if(!file.exists("data")){
    dir.create("data")
}

################ Question 1 and 2

## download csv file
csvurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" 
csvdestfile = "data/housing_ldaho.csv"
download.file(csvurl, csvdestfile)

## read csv data into workspace
csvdata = read.csv(csvdestfile, header=TRUE, sep=",")

## select the housing units that are worth 
## more than $1,000,000 (VAL==24) 
expensivehouses = csvdata[csvdata$VAL==24, ]


################# Question 3

## xlsx package installation
## cf: https://code.google.com/p/rexcel/
## or just: install.packages("xlsx")
## problem with rJava solved by change R version to 32bit
library(rJava)
library(xlsxjars)
library(xlsx)

## download excel spreadsheet 
excelurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
exceldestfile = "data/naturalgas.xlsx"
download.file(excelurl, exceldestfile)

## read the excel spreadsheet
# dat = read.xlsx(exceldestfile, sheetIndex=1, rowIndex=c(18:23), colIndex=c(7:15))
dat = read.xlsx("data/getdata_data_DATA.gov_NGAP.xlsx", 
                sheetIndex=1, rowIndex=c(18:23), colIndex=c(7:15))
sum(dat$Zip*dat$Ext,na.rm=T) 


################# Question 4

## xml package installation
# install.packages("XML")
library(XML)
xmlurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xmldestfile = "data/baltimore_restaurant.xml"
download.file(xmlurl,xmldestfile)

## real xml file
xmldata = xmlTreeParse(xmldestfile)
xmlroot = xmlRoot(xmldata)
count = 0;
xmlSApply(xmlroot[[1]], 
          function(i){
              factor = xmlValue(i[["zipcode"]])=="21231"
              if(factor) {count <<- count+1}
              }
          )


################# Question 5

## download csv
csvurl2="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
csvdestfile2 ="data/housing_Idho2.csv"
download.file(csvurl2,csvdestfile2);

## read csv using fread()
## package "data.table" must be installed first
# install.packages("data.table")
library(data.table)
DT=fread(csvdestfile2)

