pollutantmean <- function(
directory,  
pollutant, 
id)
{
  setwd(directory)
  files<-list.files(path=getwd(),pattern="*.csv",full.names = T)
  df<-do.call(rbind, lapply(files, read.csv))
  df2<-subset(subset(df,df$ID %in% id), !is.na(df[[pollutant]]))
  meanvalue<-colMeans(subset(df2[pollutant],), na.rm=T)
  return(meanvalue)
}

#subset(x=df,subset="",select="")
#df[df$ID[1:10] & !is.na(df$ID[1:10])]

#subset(df,df$ID %in% 1:2)
#mean(subset(df[[srccol]], !is.na(df[[srccol]])))
