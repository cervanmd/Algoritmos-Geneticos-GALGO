setwd("C:/Users/Daniel Cervantes/Desktop/Trabajo Diabetes")  ##establecer el directorio de la base de datos
  datos<-read.delim("diabetesdepuradogalgoimputado.txt", comment.char="#", row.names=1) ##Nombre del archivo con la base de datos
  aux<-readLines("diabetesdepuradogalgoimputado.txt",n=1) 
  clase<-unlist(strsplit(aux[1], "\t"))[-1]
  library(galgo)
  save.image(file="diabetesdepuradogalgo.ws.RData")
  complicacion<-configBB.VarSel(data=datos,classes=factor(clase),classification.method="ranforest",saveVariable="complicaciones",saveFrequency=5,saveFile="diabetes.Rdata",goalFitness=0.7,maxBigBangs=5,maxGenerations=20,scale=FALSE)
  blast(complicacion)
