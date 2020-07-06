rm(list=ls())
setwd("D:/archivos de usb2/COURSERA/DATA SCIENCE/CURSO 3/SCRIPTS")



#### leer los archivos #### 

#train 

totalaccxtrain<-read.table("./dataUCI/train/Inertial Signals/total_acc_x_train.txt")
totalaccytrain<-read.table("./dataUCI/train/Inertial Signals/total_acc_y_train.txt")
totalaccztrain<-read.table("./dataUCI/train/Inertial Signals/total_acc_z_train.txt")

# test

totalaccxtest<-read.table("./dataUCI/test/Inertial Signals/total_acc_x_test.txt")
totalaccytest<-read.table("./dataUCI/test/Inertial Signals/total_acc_y_test.txt")
totalaccztest<-read.table("./dataUCI/test/Inertial Signals/total_acc_z_test.txt")

#### media ####

# eje x

dfx<-rbind(totalaccxtrain,totalaccxtest)
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
mediatotalaccx<-vec

#eje y 

dfy<-rbind(totalaccytrain,totalaccytest)
dfy


vec<-mean(dfy[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,mean(dfy[,i]))
  
}
nrow(vec)
mediatotalaccy<-vec

#eje z

dfz<-rbind(totalaccztrain,totalaccztest)
dfz


vec<-mean(dfz[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,mean(dfz[,i]))
  
}
nrow(vec)
mediatotalaccz<-vec


#### desviasion estandar ####
# eje x

dfx<-rbind(totalaccxtrain,totalaccxtest)
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
desvitotalaccx<-vec

#eje y 

dfy<-rbind(totalaccytrain,totalaccytest)
dfy


vec<-sd(dfy[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,sd(dfy[,i]))
  
}
nrow(vec)
desvitotalaccy<-vec

#eje z

dfz<-rbind(totalaccztrain,totalaccztest)
dfz

head(dfz,4)

vec<-sd(dfz[,1])
vec
for (i in 2:128){
  
  vec<-rbind(vec,sd(dfz[,i]))
  
}
nrow(vec)
desvitotalaccz<-vec

#valores

mediatotalaccx
mediatotalaccy
mediatotalaccz
desvitotalaccx
desvitotalaccy
desvitotalaccz

#### segunda data ####


mediatotalaccxyz<-cbind(mediatotalaccx,mediatotalaccy,mediatotalaccz)
mediatotalaccxyz

promtotalaccxyz<-apply(mediatotalaccxyz,2,mean)

desvitotalaccxyz<-cbind(desvitotalaccx,desvitotalaccy,desvitotalaccz)
desviboaccxyz

promdesvitotalaccxyz<-apply(desvitotalaccxyz,2,mean)
promdesviboaccxyz


promdesvitotalaccxyz
promtotalaccxyz

promfinal<-rbind(promdesvitotalaccxyz,promtotalaccxyz)


write.table(promfinal,"./data/final.txt")




