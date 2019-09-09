pollutantmean <- function(
directory,  
pollutant, 
id=1:332)
{
  savedir<-getwd()
  setwd(directory)
  files<-list.files(path=getwd(),pattern="*.csv",full.names = T)
  df<-do.call(rbind, lapply(files, read.csv))
  df2<-subset(df,df$ID %in% id)
  df3<-subset(df2, !is.na(df2[[pollutant]]))
  df4<-subset(df3[pollutant],)
  meanvalue<-colMeans(df4, na.rm=T)
  setwd(savedir)
  return(meanvalue)
}

#subset(x=df,subset="",select="")
#df[df$ID[1:10] & !is.na(df$ID[1:10])]

#subset(df,df$ID %in% 1:2)
#mean(subset(df[[srccol]], !is.na(df[[srccol]])))
