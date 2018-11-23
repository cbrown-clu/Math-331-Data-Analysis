# Workflow: Using dplyr to summarize data by category
#
# In this script, we'll look at two examples of a 
# common workflow when using R with the dplyr package.  
# Scenario: We have records in a data frame, and each 
# record falls into a certain category, e.g. each 
# record could be a flower belonging to a certain species 
# (category) or each record could be a seismograph 
# reading in a certain year (category).  
# Goal: Group the data by category and compute some 
# information for each group.  For example, I might 
# like to be able to say how many records are in each 
# group, or what the mean petal length of all the 
# flowers in one species (category) is.
# 
# Example: Iris data set
data(iris)
library(dplyr)
df <- iris %>% group_by(Species) %>%
  summarize(Frequency = n(),
            Mean.Petal.Length = mean(Petal.Length),
            St.Dev.Petal.Length = sd(Petal.Length)) %>%
  ungroup()
print(df)
# You can also use your own summary functions.  
# Your summary function will need to accept a 
# vector of data and return a value.
f <- function(x) {
  return(mean(x^2))
}
df <- iris %>% group_by(Species) %>%
  summarize(Frequency = n(),
            Mean.Petal.Length = mean(Petal.Length),
            St.Dev.Petal.Length = sd(Petal.Length),
            f.of.Petal.Length = f(Petal.Length)) %>%
  ungroup()
print(df)
