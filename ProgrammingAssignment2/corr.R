#source("complete.R")
getsulfate <- function(id)
{
  #c<-nchar(id)
  if (id < 10){
    p<-paste("00",id, collapse = "", sep = "")
  } else if (id > 10 && id < 100) {
    p<-paste("0",id, collapse = "", sep = "")
  } else {
    p<-paste("",id, collapse = "", sep = "")
  }
  #cofp<-nchar(p)
  #n<-substr(p,(cofp-c),cofp)
  #print(c)
  #print(p)
  #print(cofp)
  #print(n)
  myfilename<-paste(p,".csv", collapse = "", sep = "")
  #myfilename<-paste(id,".csv")
  myfilename
  #df<-read.csv(myfilename)
  #head(df)
  
}

corr <- function(
  directory,
  threshold = 0
)
{
  #print(threshold)
  looplist<-complete(directory)
  
for (i in looplist$id) 
{
  
   #print(i)
  # if key val is above threshold, then do calc
  # else skip
  #paste("For the var i", i, " the value was ", looplist[i,"nobs"])
  if (looplist[i,"nobs"] > threshold)
  {
    y<-cor(looplist[i,"nobs"],looplist[i,"nobs"])
    print(y)
    if (exists("x")){
      x<-append(x,y)
    } else {
      x<-y
    }    #sprintf("For the var i %d the value was %d", i, looplist[i,"nobs"])
    myString<-c("For the var i", i, " the value was ", looplist[i,"nobs"]) #," which is over the threshold of ",threshold)
    print(myString, quote=F)
  }
}
  # head(looplist)
  head(x)
}

