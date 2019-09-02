pollutantmean <- function(
  #directory = "C:\Users\bmcku\Documents\GitHub\RProgramming\ProgrammingAssignment1\rprog_data_specdata\specdata",
  directory, #= normalizePath("\GitHub\RProgramming\ProgrammingAssignment1\rprog_data_specdata\specdata", winslash="\\"),
  pollutant, 
  id)
  {
  # "C:/Users/bmcku/Documents" is assumed
  #print(directory)
  setwd(directory)
  #getwd()
  
  #read.csv()
  files<-list.files(path=getwd(),pattern="*.csv",full.names = T)
  #myfiles=lapply(files,read.csv)
  df<-do.call(rbind, lapply(files, read.csv))
  #length(df)
  # if (pollutant == "sulfate")
  # {
    #a<-c(1:5)
    df2<-subset(subset(df,df$ID %in% id), !is.na(df[[pollutant]]))
    #mean(subset(subset(df,df$ID %in% id), !is.na(df[[pollutant]])))
    meanvalue<-colMeans(subset(df2[srccol],), na.rm=T)
    return(meanvalue)
  # }
  
  # if (pollutant == "nitrate")
  # {
  #   print("doh2")
  # }
}


#subset(x=df,subset="",select="")
#df[df$ID[1:10] & !is.na(df$ID[1:10])]

#subset(df,df$ID %in% 1:2)
#mean(subset(df[[srccol]], !is.na(df[[srccol]])))
