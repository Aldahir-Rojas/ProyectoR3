rm(list=ls())
setwd("C:/Users/CHOKLITO/Desktop/ProyectoR3")


#### leer los archivos #### 

#train 

trainx<-read.table("./dataUCI/train/X_train.txt")
trainy<-read.table("./dataUCI/train/y_train.txt")

# test

testx<-read.table("./dataUCI/test/X_test.txt")
testy<-read.table("./dataUCI/test/y_test.txt")


#### media ####




dfx<-cbind(trainx,trainy)
colnames(dfx)[562]<-"y"



vec<-with(dfx,tapply(dfx[,1],y, mean))
for (i in 2:561){
  
  vec<-cbind(vec,with(dfx,tapply(dfx[,i],y, mean)))
  
}

mediaX<-vec
mediaXtrain<-mediaX



dfx2<-cbind(testx,testy)
colnames(dfx2)[562]<-"y"

vec<-with(dfx2,tapply(dfx2[,1],y, mean))
for (i in 2:561){
  
  vec<-cbind(vec,with(dfx2,tapply(dfx2[,i],y, mean)))
  
}
mediaXtest<-vec

mediaXY<-rbind(mediaXtrain,mediaXtest)


#### desviasion estandar ####


vec<-with(dfx,tapply(dfx[,1],y, sd))
vec
for (i in 2:561){
  
  vec<-cbind(vec,with(dfx,tapply(dfx[,i],y, sd)))
  
}
dsXtrain<-vec


vec<-with(dfx2,tapply(dfx2[,1],y, sd))
for (i in 2:561){
  
  vec<-cbind(vec,with(dfx2,tapply(dfx2[,i],y,sd)))
  
}
dsXtest<-vec

dsXY<-rbind(dsXtrain,dsXtest)
dsXY[,1:3]


getwd()


