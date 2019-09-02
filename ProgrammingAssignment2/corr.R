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
  # print(i)
  # if key val is above threshold, then do calc
  # else skip
  if (looplist$nobs > threshold)
  {
    print("Found one")
  }
  
  
}
}

