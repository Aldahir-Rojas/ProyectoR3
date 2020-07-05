rm(list=ls())
setwd("D:/archivos de usb2/COURSERA/DATA SCIENCE/CURSO 3/SCRIPTS")



#### leer los archivos #### 

#train 

bogyroxtrain<-read.table("./dataUCI/train/Inertial Signals/body_gyro_x_train.txt")
bogyroytrain<-read.table("./dataUCI/train/Inertial Signals/body_gyro_y_train.txt")
bogyroztrain<-read.table("./dataUCI/train/Inertial Signals/body_gyro_z_train.txt")

# test

bogyroxtest<-read.table("./dataUCI/test/Inertial Signals/body_gyro_x_test.txt")
bogyroytest<-read.table("./dataUCI/test/Inertial Signals/body_gyro_y_test.txt")
bogyroztest<-read.table("./dataUCI/test/Inertial Signals/body_gyro_z_test.txt")


#### media ####

# eje x

dfx<-rbind(bogyroxtrain,bogyroxtest)
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
mediabogyrox<-vec

#eje y 

dfy<-rbind(bogyroytrain,bogyroytest)
dfy


vec<-mean(dfy[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,mean(dfy[,i]))
  
}
nrow(vec)
mediabogyroy<-vec

#eje z

dfz<-rbind(bogyroztrain,bogyroztest)
dfz


vec<-mean(dfz[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,mean(dfz[,i]))
  
}
nrow(vec)
mediabogyroz<-vec


#### desviasion estandar ####
# eje x

dfx<-rbind(bogyroxtrain,bogyroxtest)
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
desvibogyrox<-vec

#eje y 

dfy<-rbind(bogyroytrain,bogyroytest)
dfy


vec<-sd(dfy[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,sd(dfy[,i]))
  
}
nrow(vec)
desvibogyroy<-vec

#eje z

dfz<-rbind(bogyroztrain,bogyroztest)
dfz

head(dfz,4)

vec<-sd(dfz[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,sd(dfz[,i]))
  
}
nrow(vec)
desvibogyroz<-vec

#valores

mediabogyrox
mediabogyroy
mediabogyroz
desvibogyrox
desvibogyroy
desvibogyroz

#### segunda data ####


mediabogyroxyz<-cbind(mediabogyrox,mediabogyroy,mediabogyroz)
mediabogyroxyz

prombogyroxyz<-apply(mediabogyroxyz,2,mean)

desvibogyroxyz<-cbind(desvibogyrox,desvibogyroy,desvibogyroz)
desvibogyroxyz

promdesvibogyroxyz<-apply(desvibogyroxyz,2,mean)
promdesvibogyroxyz

