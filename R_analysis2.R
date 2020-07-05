rm(list=ls())
setwd("D:/archivos de usb2/COURSERA/DATA SCIENCE/CURSO 3/SCRIPTS")


#### leer los archivos #### 

#train 

boaccxtrain<-read.table("./dataUCI/train/Inertial Signals/body_acc_x_train.txt")
boaccytrain<-read.table("./dataUCI/train/Inertial Signals/body_acc_y_train.txt")
boaccztrain<-read.table("./dataUCI/train/Inertial Signals/body_acc_z_train.txt")

# test

boaccxtest<-read.table("./dataUCI/test/Inertial Signals/body_acc_x_test.txt")
boaccytest<-read.table("./dataUCI/test/Inertial Signals/body_acc_y_test.txt")
boaccztest<-read.table("./dataUCI/test/Inertial Signals/body_acc_z_test.txt")


#### media ####

# eje x

dfx<-rbind(boaccxtrain,boaccxtest)
dfx


length(dfx[,1])
dfx[,1:2]

#vec<-sapply(dfx[,1],mean)
vec<-mean(dfx[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,mean(dfx[,i]))
  
}
nrow(vec)
mediaboaccx<-vec

#eje y 

dfy<-rbind(boaccytrain,boaccytest)
dfy


vec<-mean(dfy[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,mean(dfy[,i]))
  
}
nrow(vec)
mediaboaccy<-vec

#eje z

dfz<-rbind(boaccztrain,boaccztest)
dfz


vec<-mean(dfz[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,mean(dfz[,i]))
  
}
nrow(vec)
mediaboaccz<-vec


#### desviasion estandar ####
# eje x

dfx<-rbind(boaccxtrain,boaccxtest)
dfx


length(dfx[,1])
dfx[,1:2]

#vec<-sapply(dfx[,1],mean)
vec<-sd(dfx[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,sd(dfx[,i]))
  
}
nrow(vec)
desviboaccx<-vec

#eje y 

dfy<-rbind(boaccytrain,boaccytest)
dfy


vec<-sd(dfy[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,sd(dfy[,i]))
  
}
nrow(vec)
desviboaccy<-vec

#eje z

dfz<-rbind(boaccztrain,boaccztest)
dfz

head(dfz,4)

vec<-sd(dfz[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,sd(dfz[,i]))
  
}
nrow(vec)
desviboaccz<-vec

#valores

mediaboaccx
mediaboaccy
mediaboaccz
desviboaccx
desviboaccy
desviboaccz

#### segunda data ####


mediaboaccxyz<-cbind(mediaboaccx,mediaboaccy,mediaboaccz)
mediaboaccxyz

promboaccxyz<-apply(mediaboaccxyz,2,mean)

desviboaccxyz<-cbind(desviboaccx,desviboaccy,desviboaccz)
desviboaccxyz

promdesviboaccxyz<-apply(desviboaccxyz,2,mean)
promdesviboaccxyz



















