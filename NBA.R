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
c_url=paste("http://www.numberfire.com/nba/daily-fantasy/daily-basketball-projections/c")
sitePage=htmlParse(c_url)
CStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(CStats.Table)[2]= "Name"
names(CStats.Table)[11]= "Points"
names(CStats.Table)[12]= "Cost"

CStats.Table[3:10] <- list(NULL)
CStats.Table[5] <- list(NULL)
CStats.Table[1] <- list(NULL)
CStats.Table[4] <- list(NULL)


C2<-cSplit(CStats.Table,"Name", sep= "(", type.convert=FALSE)

C2[,4]<- list(NULL)

C2$Position<-rep("C",nrow(C2))


names(C2)[3]= "Name"

##Point Guard
PG_url=paste("http://www.numberfire.com/nba/daily-fantasy/daily-basketball-projections/pg")
sitePage=htmlParse(PG_url)
PGStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(PGStats.Table)[2]= "Name"
names(PGStats.Table)[11]= "Points"
names(PGStats.Table)[12]= "Cost"

PGStats.Table[3:10] <- list(NULL)
PGStats.Table[5] <- list(NULL)
PGStats.Table[1] <- list(NULL)
PGStats.Table[4] <- list(NULL)


PG2<-cSplit(PGStats.Table,"Name", sep= "(", type.convert=FALSE)

PG2[,4]<- list(NULL)

PG2$Position<-rep("PG",nrow(PG2))


names(PG2)[3]= "Name"

##Shooting Guard
SG_url=paste("http://www.numberfire.com/nba/daily-fantasy/daily-basketball-projections/sg")
sitePage=htmlParse(SG_url)
SGStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(SGStats.Table)[2]= "Name"
names(SGStats.Table)[11]= "Points"
names(SGStats.Table)[12]= "Cost"

SGStats.Table[3:10] <- list(NULL)
SGStats.Table[5] <- list(NULL)
SGStats.Table[1] <- list(NULL)
SGStats.Table[4] <- list(NULL)


SG2<-cSplit(SGStats.Table,"Name", sep= "(", type.convert=FALSE)

SG2[,4]<- list(NULL)

SG2$Position<-rep("SG",nrow(SG2))


names(SG2)[3]= "Name"

##Small Forward
SF_url=paste("http://www.numberfire.com/nba/daily-fantasy/daily-basketball-projections/sf")
sitePage=htmlParse(SF_url)
SFStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(SFStats.Table)[2]= "Name"
names(SFStats.Table)[11]= "Points"
names(SFStats.Table)[12]= "Cost"

SFStats.Table[3:10] <- list(NULL)
SFStats.Table[5] <- list(NULL)
SFStats.Table[1] <- list(NULL)
SFStats.Table[4] <- list(NULL)

SF2<-cSplit(SFStats.Table,"Name", sep= "(", type.convert=FALSE)

SF2[,4]<- list(NULL)

SF2$Position<-rep("SF",nrow(SF2))


names(SF2)[3]= "Name"


##Power Forward
PF_url=paste("http://www.numberfire.com/nba/daily-fantasy/daily-basketball-projections/pf")
sitePage=htmlParse(PF_url)
PFStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(PFStats.Table)[2]= "Name"
names(PFStats.Table)[11]= "Points"
names(PFStats.Table)[12]= "Cost"

PFStats.Table[3:10] <- list(NULL)
PFStats.Table[5] <- list(NULL)
PFStats.Table[1] <- list(NULL)
PFStats.Table[4] <- list(NULL)


PF2<-cSplit(PFStats.Table,"Name", sep= "(", type.convert=FALSE)

PF2[,4]<- list(NULL)

PF2$Position<-rep("PF",nrow(PF2))


names(PF2)[3]= "Name"

Stats<- rbind(C2,PG2,SG2,SF2,PF2)




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


write.csv(Stats,file = "NBA.csv")
