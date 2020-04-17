#this is a script for turning my absolute unrarefied otu table into relative abundance
#### Sources  ####
#this script borrows bits and bobs from
#https://stevencarlislewalker.wordpress.com/2012/07/24/relative-abundance-in-r/
#https://bioinfomagician.wordpress.com/2014/08/12/my-favorite-commands-part3-sweep-function-in-r/

####setting the scene#####

setwd("C:/Users/sally/OneDrive/Documents 201617/R/Nitritepaper/2020_Nitritepaper_Datamanip")
rm(list=ls())
Sys.setenv(PATH = paste(Sys.getenv("PATH"), "*InstallDirectory*/Rtools/bin/",
                        "*InstallDirectory*/Rtools/mingw_64/bin", sep = ";")) #for 64 bit version
Sys.setenv(BINPREF = "*InstallDirectory*/Rtools/mingw_64/bin")

#####all packages needed for this script, just install once####
#None

####open all packages needed for this script, do every time #### 
#None

####Getting the data in the right format ####
otuabs <- read.csv("20200417_otuabsolute_from_mastersheet_nodup.csv",
                   row.names = 1,sep = ",", header=TRUE)
otuabs_mat <- as.matrix(otuabs,row.names = 1)


####Checking, transforming and saving as CSV ####

#check its a matrix
class(otuabs_mat)

#check its recognising row and columns names
otuabs_mat["116676Y","Otu00002"]

#create new matrix with relative abundance of otus

oturel_nodups <- sweep(otuabs_mat, 1, rowSums(otuabs_mat), '/') 

#check that they all sum to 1
x <- rowSums(oturel_nodups)

x

#save!

write.csv(oturel_nodups, "20200417_OTUabundance_relative_from_mastersheet_nodups.csv")


#### save session info ####

sessionInfo()
