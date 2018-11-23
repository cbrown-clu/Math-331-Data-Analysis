# In this R script, we import and clean the earthquake data available 
# in quakes.txt in this folder.  This is a little challenging because
# the data set is not written in a "nice" csv format.  So, we
# need to process each individual line in the input file.  I typically
# write one function to process a line, and then I apply it to 
# each line using sapply.
#
# The final product is the Quakes.csv data set in the data sets 
# repository for this course.

# Read the earthquake data
raw <- readLines("quakes.txt")

# Write the function to process each line.
process_line <- function(x) {
  y <- gsub("[ ]{1,}",",",x)  # Regular expressions to sub out spaces for commas
  return(strsplit(y,",")[[1]])  # Split the string at the commas
}
# How many columns are in the data?
number_of_columns <- length(process_line(raw[2]))
# Now that we have everything ready, we can process the lines into a data frame
# with the following line of code.
data <- as.data.frame(t(unname(sapply(raw[2:length(raw)],process_line))))
# We need to give better names to the variables and dump the useless one.
names(data) <- c('Date','Time','EventType','Useless','Magnitude','M','Latitude','Longitude','Depth',
                 'Q','EventID','NPH','NGRM')
data$Useless <- NULL
# At this point we have our data frame but some of the variables are not
# the appropriate types.  So, we convert the types.  This is usually 
# more tedious than difficult, but making sure that factor types are
# factors and character types are characters is crucial to making
# many built-in function in R and the tidyverse behave appropriately.
# This is also a pretty common step in the data import.
#
# Convert numerical data to appropriate format
data$Magnitude <- as.numeric(as.character(data$Magnitude))
data$Latitude <- as.numeric(as.character(data$Latitude))
data$Longitude <- as.numeric(as.character(data$Longitude))
data$Depth <- as.numeric(as.character(data$Depth))
data$NPH <- as.numeric(as.character(data$NPH))
data$NGRM <- as.numeric(as.character(data$NGRM))
# Many times, we have a numerical ID provided.  This should really 
# be a character, because we don't want to do numerical things with 
# the IDs, like add or multiply them.
#
# Convert character data to appropriate format
data$EventID <- as.character(data$EventID)
# When we have a time element in our data, we would often like to 
# know the month, day, or day of the week associated with the time
# provided.  In this section I convert the dates to differently 
# useable data.
# 
# Extract year and month information from the date
data$Date <- as.Date(data$Date)
get_year <- Vectorize(function(x) {
  return(format(x,"%Y"))
})
get_month <- Vectorize(function(x) {
  return(format(x,"%B"))
})
data$Year <- factor(get_year(data$Date))
data$Month <- factor(get_month(data$Date))
# Create a timeline for events from a common starting point
X <- as.POSIXct(unname(sapply(1:nrow(data),function(j)
  paste(data$Date[j],data$Time[j],sep=' '))))
init <- X[1]
X2 <- as.numeric(X-init)/3600
data$TimelineHours <- X2
data <- data[order(data$TimelineHours),]
# When we are computing new variables, we often have to 
# anticipate what we will need later.  So this is a bit of 
# an art form!  I'm pretty satisfied with what I've built so 
# far, and so it is time to export this dataset to a csv 
# format.
#
# Save the data in a csv format
write.csv(data,"Quakes.csv",row.names = FALSE)
# When I build a data set I like to include the code that 
# I would use to read the thing back in, so that later 
# users can copy-paste it into their own code and not have 
# to fight with R too much.
# 
# Here is the code to read the data back in
quakes <- read.csv("Quakes.csv")
quakes$Year <- factor(quakes$Year)
