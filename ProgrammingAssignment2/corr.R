#source("complete.R")

complete <- function(
  directory,
  id = 1:332
)
{
  setwd(directory)
  files<-list.files(path=getwd(),pattern="*.csv",full.names = T)
  df<-do.call(rbind, lapply(files, read.csv))
  dfout = data.frame()
  for(i in id)
  {
    cnt<-nrow(subset(df,df$ID==i & !is.na(df$sulfate) & !is.na(df$nitrate)))
    dfout <- rbind(dfout, c(i, cnt))
  }
  colnames(dfout)<-c("id","nobs")
  return(dfout)
}

getsulfate <- function(id)
{
  # based on whether or not the file name is a certain length, 
  #   then make a decision on how many zero's to prepend
  if (id < 10){
    p<-paste("00",id, collapse = "", sep = "")
  } else if (id >= 10 && id < 100) {
    p<-paste("0",id, collapse = "", sep = "")
  } else {
    p<-paste("",id, collapse = "", sep = "")
  }

  myfilename<-paste(p,".csv", collapse = "", sep = "")
  myfilename
  df<-read.csv(myfilename)
  #head(df)

  df[,"sulfate"]
  # # another way of subsetting
  # subset(df,select==c("sulfate"))
}

getnitrate <- function(id)
{
  # based on whether or not the file name is a certain length, 
  #   then make a decision on how many zero's to prepend
  if (id < 10){
    p<-paste("00",id, collapse = "", sep = "")
  } else if (id >= 10 && id < 100) {
    p<-paste("0",id, collapse = "", sep = "")
  } else {
    p<-paste("",id, collapse = "", sep = "")
  }
  
  myfilename<-paste(p,".csv", collapse = "", sep = "")
  df<-read.csv(myfilename)
  df[,"nitrate"]
}

corr <- function(
  directory,
  threshold = 0
)
{
  looplist<-complete(directory)
  v<-numeric()
for (i in looplist$id) 
{
  
  # if key val is above threshold, then do calc
  # else skip
  #paste("For the var i", i, " the value was ", looplist[i,"nobs"])
  #print(i)
  #print(looplist[i,"nobs"])
  if (looplist[i,"nobs"] > threshold)
  {
    #print("getting nitrate")
    x<-getnitrate(i)
    #print("getting sulfate")
    y<-getsulfate(i)
    #print("getting correlation")
    z<-cor(x,y,use="complete.obs")
    #print(z)
    #exists("v")
    # if (exists("v")){
      v<-append(v,z)
    # } else {
    #   v<-z
    # }    
    #sprintf("For the var i %d the value was %d", i, looplist[i,"nobs"])
    myString<-c("For the var i", i, " the value was ", looplist[i,"nobs"]) #," which is over the threshold of ",threshold)
    #print(myString, quote=F)
  }
}
  # head(looplist)
  #head(v)
  v
}

