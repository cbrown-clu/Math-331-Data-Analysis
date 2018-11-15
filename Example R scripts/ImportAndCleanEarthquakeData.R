# Read the earthquake data
raw <- readLines("quakes.txt")
process_line <- function(x) {
  y <- gsub("[ ]{1,}",",",x)  # Regular expressions to sub out spaces for commas
  return(strsplit(y,",")[[1]])  # Split the string at the commas
}
number_of_columns <- length(process_line(raw[2]))
data <- as.data.frame(t(unname(sapply(raw[2:length(raw)],process_line))))
names(data) <- c('Date','Time','EventType','Useless','Magnitude','M','Latitude','Longitude','Depth',
                 'Q','EventID','NPH','NGRM')
data$Useless <- NULL
# Convert numerical data to appropriate format
data$Magnitude <- as.numeric(as.character(data$Magnitude))
data$Latitude <- as.numeric(as.character(data$Latitude))
data$Longitude <- as.numeric(as.character(data$Longitude))
data$Depth <- as.numeric(as.character(data$Depth))
data$NPH <- as.numeric(as.character(data$NPH))
data$NGRM <- as.numeric(as.character(data$NGRM))
# Convert character data to appropriate format
data$EventID <- as.character(data$EventID)
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
# Save the data in a csv format
write.csv(data,"Quakes.csv",row.names = FALSE)
# Here is the code to read the data back in
quakes <- read.csv("Quakes.csv")
quakes$Year <- factor(quakes$Year)
