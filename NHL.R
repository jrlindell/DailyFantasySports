# install.packages("xlsx")
# install.packages("lpSolve")
# install.packages("splitstackshape")


# library(XML)
# library(utils)
# library(car)
# library(splitstackshape)
# library(lpSolve)
# library(xlsx)
# library(fastR)


##Center
c_url=paste("http://www.numberfire.com/nhl/daily-fantasy-hockey-projections/c")
sitePage=htmlParse(c_url)
CStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(CStats.Table)[1]= "Name"
names(CStats.Table)[12]= "Points"
names(CStats.Table)[13]= "Cost"

CStats.Table[2:11] <- list(NULL)
CStats.Table[14:38] <- list(NULL)
CStats.Table[4:13] <- list(NULL)


C2<-cSplit(CStats.Table,"Name", sep= "(", type.convert=FALSE)

C2[,4]<- list(NULL)

C2$Position<-rep("C",nrow(C2))


names(C2)[3]= "Name"

##Left Wing
LW_url=paste("http://www.numberfire.com/nhl/daily-fantasy-hockey-projections/lw")
sitePage=htmlParse(LW_url)
LWStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(LWStats.Table)[1]= "Name"
names(LWStats.Table)[12]= "Points"
names(LWStats.Table)[13]= "Cost"

LWStats.Table[2:11] <- list(NULL)
LWStats.Table[14:38] <- list(NULL)
LWStats.Table[4:13] <- list(NULL)


LW2<-cSplit(LWStats.Table,"Name", sep= "(", type.convert=FALSE)

LW2[,4]<- list(NULL)

LW2$Position<-rep("LW",nrow(LW2))


names(LW2)[3]= "Name"

##Right Wing
RW_url=paste("http://www.numberfire.com/nhl/daily-fantasy-hockey-projections/rw")
sitePage=htmlParse(RW_url)
RWStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(RWStats.Table)[1]= "Name"
names(RWStats.Table)[12]= "Points"
names(RWStats.Table)[13]= "Cost"

RWStats.Table[2:11] <- list(NULL)
RWStats.Table[14:38] <- list(NULL)
RWStats.Table[4:13] <- list(NULL)


RW2<-cSplit(RWStats.Table,"Name", sep= "(", type.convert=FALSE)

RW2[,4]<- list(NULL)

RW2$Position<-rep("RW",nrow(RW2))


names(RW2)[3]= "Name"

##Defense
D_url=paste("http://www.numberfire.com/nhl/daily-fantasy-hockey-projections/d")
sitePage=htmlParse(D_url)
DStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(DStats.Table)[1]= "Name"
names(DStats.Table)[12]= "Points"
names(DStats.Table)[13]= "Cost"

DStats.Table[2:11] <- list(NULL)
DStats.Table[14:38] <- list(NULL)
DStats.Table[4:13] <- list(NULL)



D2<-cSplit(DStats.Table,"Name", sep= "(", type.convert=FALSE)

D2[,4]<- list(NULL)

D2$Position<-rep("D",nrow(D2))


names(D2)[3]= "Name"


##Goalies
G_url=paste("http://www.numberfire.com/nhl/daily-fantasy-hockey-projections/goalies")
sitePage=htmlParse(G_url)
GStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(GStats.Table)[1]= "Name"
names(GStats.Table)[12]= "Points"
names(GStats.Table)[13]= "Cost"

GStats.Table[2:11] <- list(NULL)
GStats.Table[14:38] <- list(NULL)
GStats.Table[4:13] <- list(NULL)


G2<-cSplit(GStats.Table,"Name", sep= "(", type.convert=FALSE)

G2[,4]<- list(NULL)

G2$Position<-rep("G",nrow(G2))


names(G2)[3]= "Name"

Stats<- rbind(C2,LW2,RW2,D2,G2)





##Optimization
#Max Points
# Cost <= $
# Players <= #
# C>= 2
# LW >= 2
# RW >= 2
# D >=2
# G >=1
# binary


write.csv(Stats,file = "NHL.csv")

#lpSolve