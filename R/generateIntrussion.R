######################################################################
## author:        Rafael Cabañas (rcabanas@decsai.ugr.es)
## date:          8th September 2017
## description:   Transforms the data set kddcup_discrete.arff with
##                discrete variables into an equivalent one with 
##                continuous variabels. 
##                (section 4.2 of the paper)
######################################################################

rm(list=ls())
library(RWeka)
setwd(dirname(sys.frame(1)$ofile))
source("lib/utilCDD.R")


datapath = "../datasets/"

##### Generation parameters #####

# Size of each file in the distributed data set
fileSize = 25000

########## Saving data #########

inputdata = read.arff(paste(c(datapath, "kddcup_discrete.arff"), collapse=""))

databin = preprocessing(inputdata, getDomains(inputdata), iclass=4, FALSE, dropClass = TRUE)
prefixFile =  paste("kddcupNoClass_", fileSize/1000, "k", sep="") 
splitAndSave(databin, datapath, prefixFile, fileSize)



#####

