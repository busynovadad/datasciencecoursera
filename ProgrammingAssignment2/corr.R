#source("complete.R")
corr <- function(
  directory,
  threshold = 0
)
{
  print(threshold)
  looplist<-complete(directory)
  
for (i in looplist$id) 
{
   #print(i)
  # if key val is above threshold, then do calc
  # else skip
  paste("For the var i", i, " the value was ", looplist[i,"nobs"])
  if (looplist[i,"nobs"] > threshold)
  {
    #sprintf("For the var i %d the value was %d", i, looplist[i,"nobs"])
  }
}
  head(looplist)
}

