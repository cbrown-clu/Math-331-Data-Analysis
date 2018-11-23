# Writing the iris data set to a file
data('iris')
write.csv(iris,'iris.csv',row.names=FALSE)

# O-ring space shuttle data
# http://archive.ics.uci.edu/ml/datasets/Challenger+USA+Space+Shuttle+O-Ring
#
library(data.table)
shuttle <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/space-shuttle/o-ring-erosion-or-blowby.data")
names(shuttle) <- c('Number.Orings.At.Risk',
                    'Number.Orings.In.Thermal.Distress',
                    'Launch.Temperature',
                    'Leak-check.Pressure.PSI',
                    'Temporal.Order.Of.Flight')
write.csv(shuttle,'shuttle.csv',row.names=FALSE)

# TMDb 5000 movie dataset from kaggle.com
# https://www.kaggle.com/tmdb/tmdb-movie-metadata 
#
# I downloaded this to my machine and loaded it into R.  You can access it at the URL 
# but I believe you will need to install the Kaggle client on your machine to download
# Directly from the website.
movies <- read.csv("tmdb_5000_movies.csv",stringsAsFactors = FALSE)

# Data sets from ISLR
library(ISLR)
data(Auto)
write.csv(Auto,"auto.csv",row.names=FALSE)
library(MASS)
data(Boston)
write.csv(Boston,"boston.csv",row.names = FALSE)
data("Caravan")
write.csv(Caravan,"caravan.csv",row.names = FALSE)
data("Carseats")
write.csv(Carseats,"carseats.csv",row.names=FALSE)
data(College)
write.csv(College,"college.csv",row.names = FALSE)
data(Default)
write.csv(Default,"default.csv",row.names = FALSE)
data("Hitters")
write.csv(Hitters,"hitters.csv",row.names = FALSE)
# This next one is a bit odd, because it is not a tabular data structure.
# Need to work on this.
data("Khan")
sink("khan.txt")
print(Khan)
sink()
# To read this back in use
raw_khan <- readLines("khan.txt")

# Same here
data("NCI60")

data("OJ")
write.csv(OJ,"oj.csv",row.names = FALSE)
data(Portfolio)
write.csv(Portfolio,"portfolio.csv",row.names = FALSE)
data(Smarket)
write.csv(Smarket,"smarket.csv",row.names = FALSE)
data(USArrests)
write.csv(USArrests,"usarrests.csv",row.names = FALSE)
data("Wage")
write.csv(Wage,"wage.csv",row.names = FALSE)
data(Weekly)
write.csv(Weekly,"weekly.csv",row.names = FALSE)

# Kaggle exoplanet data
# https://www.kaggle.com/keplersmachines/kepler-labelled-time-series-data 
#
exo <- read.csv("exoTest.csv")

# Mud crab data
rawmudcrab <- readLines("mudcrab.txt")
process_line <- function(y) {
  strsplit(y,"\\s+")[[1]]
}
mc_names <- process_line(rawmudcrab[1])
mc <- matrix(nrow = length(rawmudcrab)-1, ncol = length(mc_names),
             dimnames = list(1:(length(rawmudcrab)-1),mc_names))
for (j in 1:nrow(mc)) {
  mc[j,] <- process_line(rawmudcrab[j+1])
}
write.csv(mc,"mudcrab.csv",row.names=FALSE)
