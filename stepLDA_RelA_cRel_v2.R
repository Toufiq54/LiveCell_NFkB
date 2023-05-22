# LDA with RelA and c-Rel data
# Shah Md Toufiqur Rahman
# Affiliation: National Institute on Aging
# Date: 04/20/2023
#-------------------------------------------------------------------------------
#LOAD NECESSARY LIBRARIES
library(ggplot2)
library(MASS)
library(lattice)
library(caret)
library(recipes)
library(caTools)  # for data splitting and training data generation 
#-------------------------------------------------------------------------------
#LOAD AND VIEW DATA
setwd("T:/LMBI/021Transcription_Systems_Dynamics_and_Biology/Toufiq/R studio project/DKin project2/Signaling features information")

#SCALE PREDICTOR VARIABLES
datt <- read.csv("pBMDM_Y_signaling_features_RelA_cRel.csv")
ligand <- factor(c(datt$ligand),levels = c("LPS Enzo","Flagellin","CpG","Poly_IC","R848","Pam3CSK","TNF"))
# Make the data frame
dat <- data.frame(datt[1:16],ligand)
#-------------------------------------------------------------------------------
#check that each predictor variable has mean=0 and sd=1
dat[1:16] <- scale(dat[1:16])

apply(dat[1:16], 2, mean)
apply(dat[1:16], 2, sd)
#-------------------------------------------------------------------------------
#SPLIT DATA INTO TRAINING AND TESTING SET
for (i in 1:10){
  set.seed(i)
  #sample <- dat$ligand %>% 
  #    createDataPartition(p = 0.7, list = FALSE) 
  #train <- dat[sample,]
  #test <- dat[-sample,]
  
  sample <- sample.split(dat$ligand,SplitRatio=0.7)
  train1 <- subset(dat,sample==TRUE)
  test <- subset(dat,sample==FALSE) 
  #-------------------------------------------------------------------------------
  #FIT LDA MODEL
  model <- lda(ligand~., data=train1)
  model
  
  library(caret)
  library(plyr)
  library(recipes)
  library(dplyr)
  slda <- train(ligand ~ ., data = train1,
                method = "stepLDA",
                trControl = trainControl(method = "cv"))
  
  #-------------------------------------------------------------------------------
  # Verify results
  conf <- table(list(predicted=predict(model,test)$class, observed=test$ligand))
  # save the confusion matrix in .CSV file
  filename = (paste("T://LMBI//021Transcription_Systems_Dynamics_and_Biology//Toufiq//R studio project//DKin project2//Confusion matrix//confusion matrix 10fold_CV//Confusion_LDA_RelA_&cRel_",i,".CSV",sep=""))
  write.csv(conf,filename)
}
##################################################################################

