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