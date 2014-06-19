################ Qustion 1

## install "httr" packages
library(httr)

## OAuth for github
oauth_endpoints("github")

## create a github application 
## get the oauth key and secret
## "httrpuv" package must be installed for oauth
myapp <- oauth_app(APPNAME, KEY, SECRET)

## get credentials
github_token <- oauth2.0_token(
  oauth_endpoints("github"), 
  myapp)
## it will open an authorization windown in browser

## using API
req <- GET("https://api.github.com/users/jtleek/repos", 
           config(token = github_token))
stop_for_status(req)
json <- content(req)

## answer question 1
ans=c()
aa<-sapply(json, 
           function(i){
             if(i$url=="https://api.github.com/repos/jtleek/datasharing"){
               ans<<-i$created_at
               }
             }
           )


####################### Question 2 and 3
## sqldf(sqlstring)


####################### Question 4
conn = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode = readLines(conn)
## get answer
ans = c(nchar(htmlcode[10]),nchar(htmlcode[20]),
        nchar(htmlcode[30]),nchar(htmlcode[100]))
close(conn)


###################### Question 5
conn = url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for")
fwfdata = read.fwf(  conn,  skip=4,
                     width=c(13,6,7,6,7,6,7,6,7), 
                     colClasses=c("character",
                                  "numeric","numeric","numeric","numeric",
                                  "numeric","numeric","numeric","numeric") 
                     )
close(conn)


