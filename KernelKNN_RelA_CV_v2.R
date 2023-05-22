# This R-script will calculate the KNN plot of RelA and cRel signaling features 
# Written by: Shah Md Toufiqur Rahman
# Date: 10/7/2022
# Affiliation: National Institute on Aging
#-------------------------------------------------------------------------------
# Load the libraries
library(lattice)
library(caret)
library(recipes)
library(caTools)  # for data splitting and training data generation 
require("class") # load pre-installed package
library(KernelKnn)
#-------------------------------------------------------------------------------
# Load the data
setwd("T:/LMBI/021Transcription_Systems_Dynamics_and_Biology/Toufiq/R studio project/DKin project2/Signaling features information")
datt <- read.csv("pBMDM_Y_signaling_features_RelA_KernelKnn.csv")
#ligand <- factor(c(datt$ligand),levels = c("1","2","3","4","5","6","7"))
#dat <- data.frame(datt[1:16],ligand)  # make data frame
dat <- data.frame(datt)
#--------------------------------------------------------------------------------
# Preprocess the dataset
set.seed(10)
rnum <- sample (rep(1:nrow(dat)))
dat <- dat [rnum,]

# Normalize the dataset between values 0 and 1
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}

dat.new<- as.data.frame(lapply(dat[,c(1,2,3,4,5,6,7,8)],normalize))
head(dat.new)


# Apply k-NN classification algorithm

for (i in 1:10){ 
  
  # subset the data
  set.seed(i)
  sample <- sample.split(dat$ligand,SplitRatio=0.7)
  dat.train <- subset(dat.new,sample==TRUE)
  dat.test <- subset(dat.new,sample==FALSE)
  
  #sample <- sample(c(TRUE, FALSE), nrow(dat.new), replace=TRUE, prob=c(0.7,0.3))
  #train <- dat[sample, ]
  #test <- dat[!sample, ] 
  
  #dat.train <- dat.new[sample, ]
  #dat.test <- dat.new[!sample, ] 
  
  dat.train.target <-( dat[sample,9])
  dat.test.target <- (dat[!sample,9] )
  
  model1 <- KernelKnn(dat.train, TEST_data = dat.test, dat.train.target, k = 7 , 
                      
                      method = 'canberra', weights_function = NULL, regression = F,
                      
                      Levels = unique(dat.train.target))
  
  cc = data.frame(model1,dat.test.target)
  
  # Verify results
  #tab <-table(dat.test.target, model1)
  # save the confusion matrix in .CSV file
  # save the confusion matrix in .CSV file
  filename = (paste("T://LMBI//021Transcription_Systems_Dynamics_and_Biology//Toufiq//R studio project//DKin project2//Confusion matrix//KernelKNN_10fold_CV_confusionMatrix//KernelKNN_canberra_k=7_",i,"_RelA_",".CSV",sep=""))
  write.csv(cc,filename)
}
#---------------------------------------------------------------------------------------

