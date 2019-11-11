# install.packages("acs", clean=T)
# api.key.install(key=" 9ef808ddf526c3091c4e1bd8ab20f7f7bf8fb452")
# acs.tables.install()
# getwd()
install.packages("censusapi")`
# install.packages("devtools")
devtools::install_github("hrecht/censusapi")
library(censusapi)
mycensuskey<-"9ef808ddf526c3091c4e1bd8ab20f7f7bf8fb452"
availableapis<-listCensusApis()
View(availableapis)
myvintage <- 2015
availablevars <- listCensusMetadata(name="acs1", vintage=myvintage)
View(availablevars)
possible_vars <- subset(availablevars,
                          grepl("median household income", availablevars$label, 
                              ignore.case = TRUE))
View(possible_vars)
availablegeos <- listCensusMetadata(name="acs1", vintage=myvintage, type="g")
View(availablegeos)
median_incomes_us <- getCensus(name="acs1", vintage=myvintage, key=mycensuskey,vars=c("NAME", "B19013_001E", "B19013_001M"),
                               region="urban area:*")
mdcode <-median_incomes_us$urban_area[median_incomes_us$NAME=="Baltimore, MD Urbanized Area (2010)"]
View(mdcode)
