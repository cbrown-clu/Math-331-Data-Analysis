k <- 3.6
f <- function(x) {
  return(k*x*(1-x))
}
epsilon_filter <- function(x,epsilon = 10^(-10)) {
  y <- x
  y <- unique(y)
  i <- 1
  while(i<= length(y)) {
    flag <- !(abs(y-y[i])>0 & abs(y-y[i])<epsilon)
    y <- y[flag]
    i <- i+1
  }
  return(y)
}
dds_stability <- function(f,initial,burnin=5000,len=500) {
  x <- initial
  for (i in 1:burnin) {
    x <- f(x)
  }
  record <- c(x)
  for (i in 2:len) {
    x <- f(x)
    record <- c(record,x)
  }
  epsilon_filter(unique(kmeans(record,centers=unique(record),iter.max=100)$centers[,1]))
}
y <- dds_stability(f,0.1)
epsilon_filter(y)
