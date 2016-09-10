forjan <- read.csv("forjan.csv", stringsAsFactors = FALSE)
library(ctnamecleaner)

?ctnamecleaner
ctnamecleaner(Town, forjan, filename="analysis", case="Title")

analysis <- read.csv("analysis.csv", stringsAsFactors = FALSE)

analysis2 <- data.frame(with(analysis, tapply(Donations, real.town.name, sum)))

analysis2$town <- row.names(analysis2)
colnames(analysis2) <-c("Donations", "Town")
row.names(analysis2) <- NULL                  

analysis2 <- analysis2[c("Town", "Donations")]

totals <- read.csv("totals.csv", stringsAsFactors = FALSE)

analysis3 <- data.frame(with(totals, tapply(a, real.town.name, sum)))
analysis3$town <- row.names(analysis3)
colnames(analysis3) <-c("Donation sum", "Town")
row.names(analysis3) <- NULL      
library(dplyr)
analysis4 <- left_join(analysis2, analysis3)

library(trendct)
?trendmap

trendmap(analysis4, headline="Donations to Presidential candidates in 2015", subhead="",
         src="Federal Election Commission", byline="Andrew Ba Tran/TrendCT.org", url_append="date", shape="towns", color="yellow-red")

