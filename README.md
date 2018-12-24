# Math 331 Data Analysis

## About
This is the repository for the Math 331 course.  In this folder you can find the grading scheme and course schedule.

Other folders in this repository include:
* "A. Course reading/viewing materials - includes the three main course texts and supplementary materials.  Also includes the homework assignments and article reflections.
* "B. Data sets used in the class
* "C. Example scripts in R
* "D. Example document source and output in RMarkdown
* "E. Rubrics for homeworks, article reflections, course projects, and the course binder.

## Links to resources
### Resources for the course
[Course BlackBoard pages]()  You will need to use your university login to access this.

The [download page for R at our nearest CRAN mirror](http://cran.stat.ucla.edu/)

The [RStudio Desktop download page](https://www.rstudio.com/products/rstudio/download/)

Once you have these installed you should install the **tidyverse** package by issuing the command *install.packages("tidyverse")* .  Link to the [tidyverse home page](https://www.tidyverse.org/), which in turn has a link to Wickham and Grolemund's book [R for Data Science](https://r4ds.had.co.nz/), which you can read online for free.

Link to the [Notepad++ text editor](https://notepad-plus-plus.org/).  This is what I use to edit markdown documents and most text documents I run into; great replacement for the Windows notepad editor.

The [LibreOffice software](https://www.libreoffice.org/) is an alternative to the Microsoft Office suite.  LibreOffice edits documents in open formats, and so works very well with Google docs.

[Git software](https://git-scm.com/) for version control.

[Github](https://github.com/) and [Github Desktop](https://desktop.github.com/) for sharing projects and version control.

### Resources for data science
The [Open Source Data Science Master's Degree curriculum](http://datasciencemasters.org/).  If we only had enough time to go through all of this...

[Kaggle](https://www.kaggle.com/) for predictive modeling and data analysis.  Lots of great examples of data analysis performed on real world data sets.

[KDnuggets](https://www.kdnuggets.com/) for news and articles from the data science world.

[R-bloggers](https://www.r-bloggers.com/).  Blogs written by people who use or are learning to use R.  Great place to search for common R tasks and how to perform them.

[stack**overflow**](https://stackoverflow.com/questions/tagged/r)'s list of newest R questions.  Great place to search when R is giving you problems, throwing errors, etc.



## Future additions

### Planned additions for Spring 2019:
* Add example R scripts for some basic tasks: I need a table connecting scripts and tasks, since some scripts may cover more than one task. To include some basic statistical analyses, graphical and numerical tests.
* Projects
* RMarkdown examples.  These can be longer analyses.  Should also include some simulation approaches to some common statistical tests.  This can help students understand what a given statistical test (e.g. t test) actually means.

### Planned additions for future iterations of the course:
* Optional parallel material in Python as Jupyter notebooks
* Screencasts of various tasks
* Add discussion forum(s) in BlackBoard or some other place?

## Some basic definitions
You'll hear some terms thrown around in the world of data science/data analysis/computational statistics/etc.  Most of them are (a) ill-defined and (b) changing.  Here are a few of my thoughts on these terms and how they relate to the course material.
* **Data science**: This is the big term, and one you can hear thrown around a lot nowadays.  It's been said that a data scientist's job is to be a better programmer than most statisticians and a better statistician than most programmers.  It's also been said that a data scientist's job is to convert data into knowledge.  To be a little more precise, data science is the science concerned with the acquisition of data, its curation, analysis, communication, and application.  [Read more about data science on Wikipedia](https://en.wikipedia.org/wiki/Data_science).
* **Data analysis**: The data analyst's focus is on the statistics, mathematics, and communications pieces of data science.  The data analyst's job really starts when the data arrives.  [Read more about data analysis](https://en.wikipedia.org/wiki/Data_analysis).
* **Data mining**: In data mining, we are often looking for patterns or correlations without having a clear idea of any structure or model in the data.  For example, if we a a few million tweets with all hashtags, we might be interested in finding out whether the tweets all fall into a few categories...even when we don't know what those categories are.  Data mining is a collection of algorithms and practices that support exploratory data analysis.  [Read more about data mining](https://en.wikipedia.org/wiki/Data_mining).
* **Machine learning/Statistical learning**: The algorithms and practices used in improving computer performance in carrying out specified activities.  Statistical learning is an "old-school" term for what has now come to be called machine learning.  [Read more about machine learning](https://en.wikipedia.org/wiki/Machine_learning).
* **Deep learning**: Algorithms and practices to automatically form data from information and model it ("learn data representations").  Deep learning algorithms tend to work very well when we have lots of information that is fairly unstructured (like images or tweets) and we also don;t have a clear idea of how to structure the information (what features are important and should be extracted from the information?).  [Read moe about deep learning](https://en.wikipedia.org/wiki/Deep_learning).

