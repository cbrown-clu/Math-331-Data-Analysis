# Exploratory data analysis with the iris data set
#
# In this script we perform a few basic tasks that 
# are common in any data analysis.  We:
# 1. Import the data and clean if necessary
# 2. Summarize variables with tables and graphs
# 3. Formulate questions
# 4. Compute new variables with formulas or filtration
# 5. Produce graphs of new variables as needed
# 6. Produce basic statistical computations like
#    parameter estimations, hypothesis tests, or
#    computational experiments.
# 7. Report on results
#
# We'll use one of the first datasets any 
# computational statistician should see, the iris dataset.
# 

# 1. Import the data.  This dataset is part of R's 
#    datasets library, and so we can simply load it with 
#    the data command.
data(iris)
# Let's look at the top of the dataset.
head(iris)
# Everything looks good, and it does not appear that 
# we will need to change the types of any variables.
# So let's move on to...

# 2. Summarize variables
summary(iris)
# For numerical variables, we will see a five number 
# summary of each together with the mean.  For categorical 
# data (factors) we will see a frequency count for each
# level in the factor.  Here, we see that we have
# 50 records for each species.
# 
# Graphically, we can compare the histograms for each 
# variable for the three species.  The ggplot2
# package has a very steep learning curve, but 
# produces amazing results.  Notice that I did a lot of
# copy-paste for the commands below.  What changes line 
# to line?

library(ggplot2)
ggplot(data=iris,aes(x=Sepal.Length,colour=Species,fill=Species)) +
  geom_histogram(bins=50,position="dodge",alpha=0.4) +
  labs(title="Sepal Length")

ggplot(data=iris,aes(x=Sepal.Width,colour=Species,fill=Species)) +
  geom_histogram(bins=50,position="dodge",alpha=0.4) +
  labs(title="Sepal Width")

ggplot(data=iris,aes(x=Petal.Length,colour=Species,fill=Species)) +
  geom_histogram(bins=50,position="dodge",alpha=0.4) +
  labs(title="Petal Length")

ggplot(data=iris,aes(x=Petal.Width,colour=Species,fill=Species)) +
  geom_histogram(bins=50,position="dodge",alpha=0.4) +
  labs(title="Petal Width")
# WHile the histogram contains more information, sometimes 
# the box-whisker plot is easier to read.
ggplot(data=iris,aes(x=Species,y=Sepal.Length,fill=Species)) +
  geom_boxplot(outlier.color = 'red') +
  labs(title="Sepal.Length")

ggplot(data=iris,aes(x=Species,y=Sepal.Width,fill=Species)) +
  geom_boxplot(outlier.color = 'red') +
  labs(title="Sepal.Width")

ggplot(data=iris,aes(x=Species,y=Petal.Length,fill=Species)) +
  geom_boxplot(outlier.color = 'red') +
  labs(title="Petal.Length")

ggplot(data=iris,aes(x=Species,y=Petal.Width,fill=Species)) +
  geom_boxplot(outlier.color = 'red') +
  labs(title="Petal.Width")

# 3. Formulate questions.  We might formulate questions 
# based on the summaries of the data we have written, our 
# background in the knowledge domain, or just plain 
# curiosity.
# 
# A. How do the length and width measurements differ from 
# species to species?  Do any distinguish one species from 
# another?
#
# B. What is the ratio between the lengths and widths?  
# Is this relatively constant across each species?  Does 
# this differ from species to species?
#
# At this point we can perform steps 4, 5, and 6 for each 
# of our questions.
# For Question A, we can already see some answers in our 
# histograms above.  We can also formulate a hypothesis 
# and perform a formal test of hypothesis.
#
# HYPOTHESIS: Petal length is significantly different 
# between the setosa and versicolor species.
x <- iris$Petal.Length[iris$Species=='setosa']
y <- iris$Petal.Length[iris$Species=='versicolor']
t.test(x,y)  # p-value ~ 0
rm(x,y)
# CONCLUSION: Yes, petal length is significantly 
# different between the setosa and versicolor species.
# NOTE: As a formal experiment, this conclusion does 
# not have as strong a weight as it would if we had 
# approached the problem correctly.  We will see how 
# to do this later in the class.  The basic principole 
# we have violated here is that one should never use 
# the same data to both FORMULATE (exploratory) 
# hypotheses and TEST (inferential) hypotheses.  For
# now, we'll simply recognize that our conclusion is 
# not supported as strongly as it should be.
#
# HYPOTHESIS: Petal length is significanlty different 
# between the versicolor and virginica species.
x <- iris$Petal.Length[iris$Species=='virginica']
y <- iris$Petal.Length[iris$Species=='versicolor']
t.test(x,y)  # p-value ~ 0
rm(x,y)
# CONCLUSION: Yes.
#
# HYPOTHESIS: Sepal width is significantly different 
# between the versicolor and virginica species.
x <- iris$Sepal.Width[iris$Species=='virginica']
y <- iris$Sepal.Width[iris$Species=='versicolor']
t.test(x,y)  # p-value ~ 0
rm(x,y)
# CONCLUSION: Yes.
# For Question B, we will need to compute some new 
# variables and some new plots.
df <- iris
df$PetalRatio <- df$Petal.Length/df$Petal.Width
df$SepalRatio <- df$Sepal.Length/df$Sepal.Width

ggplot(data=df,aes(x=PetalRatio,colour=Species,fill=Species)) + 
  geom_histogram(bins=30,position="dodge",alpha=0.4) +
  labs(title="Ratio of Petal Length to Petal Width")

ggplot(data=df,aes(x=SepalRatio,colour=Species,fill=Species)) + 
  geom_histogram(bins=30,position="dodge",alpha=0.4) +
  labs(title="Ratio of Sepal Length to Sepal Width")

ggplot(data=df,aes(x=Species,y=PetalRatio,fill=Species)) +
  geom_boxplot(outlier.color = 'red') +
  labs(title="Ratio of Petal Length to Petal Width")

ggplot(data=df,aes(x=Species,y=SepalRatio,fill=Species)) +
  geom_boxplot(outlier.color = 'red') +
  labs(title="Ratio of Petal Length to Petal Width")

# Have we answered Question B?  Let's try two tests 
# of hypotheses.
#
# HYPOTHESIS: The ratio of petal length to petal 
# width is significantly different between the 
# setosa and versicolor species.
x <- df$PetalRatio[df$Species=='setosa']
y <- df$PetalRatio[df$Species=='versicolor']
t.test(x,y)
rm(x,y)
# CONCLUSION: Yes.
#
# HYPOTHESIS: The ratio of petal length to petal 
# width is significantly different between the 
# virginica and versicolor species.
x <- df$PetalRatio[df$Species=='virginica']
y <- df$PetalRatio[df$Species=='versicolor']
t.test(x,y)
rm(x,y)
# CONCLUSION: Yes.  But does this conclusion 
# agree with our graphs?  Even though the difference 
# is significantly different, could we use the 
# petal length to width ration to distinguish 
# between the two species?  How would we do that?
# Most importantly, could we use this result to 
# confidently classify an individual as one 
# of the two species?
#
rm(df)
# At this point we report on our results.  Our report 
# should include, at minimum...
# * concrete conlusions we have made, 
# * questions that were specifically asked 
#   that we have answered,
# * questions that were specifically asked 
#   that we have NOT answered and why,
# * and avenues for further study.
#
# The report could additionally include suggestions 
# for specific experiments to address our unanswered 
# questions or our avenues for further study.
#
# Typically, your report should not be written in 
# comments in an R script.  Graphs and tables can 
# be exported for use in Word documents.  However, 
# we would like to produce a report that contains the 
# R code we used to import data, compute new variables, 
# and produce graphs and tables (this is full 
# disclosure of how we obtained our results).  There 
# are a number of ways to accomplish this; RStudio 
# provides one, with the RMarkdown style script.
