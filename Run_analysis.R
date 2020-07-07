rm(list=ls())
setwd("D:/archivos de usb2/COURSERA/DATA SCIENCE/CURSO 3/SCRIPTS")



#### leer los archivos #### 

#train 

trainx<-read.table("./dataUCI/train/X_train.txt")
trainy<-read.table("./dataUCI/train/y_train.txt")

# test

testx<-read.table("./dataUCI/test/X_test.txt")
testy<-read.table("./dataUCI/test/y_test.txt")

#leyendo sujetos
subjectrain<- read.table("./dataUCI/train/subject_train.txt")
subjectest<- read.table("./dataUCI/test/subject_test.txt")

#leyendo acividades
activity<-read.table("./dataUCI/activity_labels.txt")

#leyendo features
features<-read.table("./dataUCI/features.txt")
head(features)
nrow(features)

#juntando los valores
subjectotal<- rbind(subjectest,subjectrain)

nrow(subjectotal)

# uniendo los valores de prueba y entrenamiento X
X <- rbind(testx,trainx)

#uniendo los valores de prueba y entrenamiento Y
Y <- rbind(testy,trainy)

mergedata<- cbind(subjectotal,activity=rep(1,10299), X, Y)

colnames(mergedata)[1]<-"subject"
colnames(mergedata)[564]<-"subject2"

#Asignando los nombres a los datos

for (i in 1:nrow(mergedata)) {
  if(mergedata$subject2[i]==1){
    mergedata$activity[i]<-"WALKING"
  }
  if(mergedata$subject2[i]==2){
    mergedata$activity[i]<-"WALKING_UPSTAIRS"
  }
  if(mergedata$subject2[i]==3){
    mergedata$activity[i]<-"WALKING_DOWNSTAIRS"
  }
  if(mergedata$subject2[i]==4){
    mergedata$activity[i]<-"SITTING"
  }
  if(mergedata$subject2[i]==5){
    mergedata$activity[i]<-"STANDING"
  }
  if(mergedata$subject2[i]==6){
    mergedata$activity[i]<-"LAYING"
  }
  print(i)
  
}


#asignando nombre a las columnas

for (i in 3:563) {
  colnames(mergedata)[i]<-features$V2[i-2]
  
}

#ordenando

library(dplyr)

mergedata<-arrange(mergedata,subject,activity)


head(mergedata[,1:5],100)

features$V2

colnames(mergedata)

write.table(mergedata, "./data/final.txt")















