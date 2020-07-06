rm(list=ls())
setwd("D:/archivos de usb2/COURSERA/DATA SCIENCE/CURSO 3/SCRIPTS")



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


















