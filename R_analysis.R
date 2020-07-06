rm(list=ls())
setwd("D:/archivos de usb2/COURSERA/DATA SCIENCE/CURSO 3/SCRIPTS")



promfinal<-rbind(promdesvitotalaccxyz,promtotalaccxyz)


write.table(promfinal,"./data/final.txt")


















