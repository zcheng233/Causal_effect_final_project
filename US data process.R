## Get the data from CDC at following link:
## https://data.cdc.gov/Case-Surveillance/COVID-19-Case-Surveillance-Public-Use-Data/vbim-akqf


covidus <- read.csv("~/Downloads/covidus.csv") ## your raw data direction
library(dplyr)
data <- subset(covidus, death_yn == "Yes")
data %>% count(age_group)
covidus %>% count(age_group)

data[[1]]=as.Date(data[[1]], format = "%Y/%m/%d")
covidus[[1]]=as.Date(covidus[[1]], format = "%Y/%m/%d")

t = as.Date(c("2020/02/19", "2020/02/28","2020/03/15","2020/03/30", "2020/04/15","2020/04/30",
              "2020/05/15","2020/05/30","2020/06/15","2020/06/30","2020/07/15","2020/07/31",
              "2020/08/15", "2020/08/31","2020/09/15","2020/09/30","2020/10/15","2020/10/30",
              "2020/11/20"))
cases <- subset(covidus, age_group != "Unknown")
cases <- subset(cases, is.NA(age_group) == F)
trend <- data.frame(Date=as.Date(character()),
                 Cases=double(), 
                 Death=double(), 
                 stringsAsFactors=FALSE) 

for (i in 1:length(t)){
  cases <- subset(cases, cdc_report_dt <= t[length(t)-i+1])
  death <- subset(cases, death_yn == "Yes")
  ct <- count(cases, age_group)
  c <- toString(ct[[2]][1:9])
  
  dt <- count(death, age_group)
  check <- ct[[1]][-10] %in% dt[[1]]
  
  j =  c()
  
  j[!check] = 0
  j[check] = dt[[2]]
  
  
  d <- toString(j)
  trend[i,1] = as.Date(t[length(t)-i+1])
  trend[i,2] = c
  trend[i,3] = d
  
}
View(trend)
write.csv(trend,"~/Downloads/trend.csv", row.names = FALSE)


