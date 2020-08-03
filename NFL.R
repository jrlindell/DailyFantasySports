# install.packages("xlsx")
# install.packages("lpSolve")
# install.packages("splitstackshape")
# install.packages("XML")
# install.packages("car")
# install.packages("splitstackshape")
# install.packages("lpSolve")
# install.packages("xlsx")
# install.packages("fastR")
# install.packages("rJava")
# install.packages("fastR", repos="http://R-Forge.R-project.org")
install.packages("data.table")


library(XML)
library(utils)
library(car)
library(splitstackshape)
library(lpSolve)
library(xlsx)
library(fastR)




##########################QB###################################

QB_url="https://www.numberfire.com/nfl/daily-fantasy/daily-football-projections/QB"
sitePage=htmlParse(QB_url)
QBStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(QBStats.Table)[2]= "Name"
names(QBStats.Table)[15]= "Points"
names(QBStats.Table)[16]= "Cost"

QBStats.Table[3:14] <- list(NULL)
QBStats.Table[5] <- list(NULL)
QBStats.Table[1] <- list(NULL)


QB2<-cSplit(QBStats.Table,"Name", sep= "(", type.convert=FALSE)

QB2[,4]<- list(NULL)

QB2$Position<-rep("1B",nrow(QB2))


names(QB2)[3]= "Name"


###########################RB###########################################

RB_url=paste("https://www.numberfire.com/nfl/daily-fantasy/daily-football-projections/RB")
sitePage=htmlParse(RB_url)
RBStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(RBStats.Table)[2]= "Name"
names(RBStats.Table)[15]= "Points"
names(RBStats.Table)[16]= "Cost"

RBStats.Table[3:14] <- list(NULL)
RBStats.Table[5] <- list(NULL)
RBStats.Table[1] <- list(NULL)


RB2<-cSplit(RBStats.Table,"Name", sep= "(", type.convert=FALSE)

RB2[,4]<- list(NULL)

RB2$Position<-rep("2B",nrow(RB2))


names(RB2)[3]= "Name"


##############################WR###########################################

WWR_url=paste("https://www.numberfire.com/nfl/daily-fantasy/daily-football-projections/WR")
sitePage=htmlParse(WR_url)
WRStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(WRStats.Table)[2]= "Name"
names(WRStats.Table)[15]= "Points"
names(WRStats.Table)[16]= "Cost"

WRStats.Table[3:14] <- list(NULL)
WRStats.Table[5] <- list(NULL)
WRStats.Table[1] <- list(NULL)


WR2<-cSplit(WRStats.Table,"Name", sep= "(", type.convert=FALSE)

WR2[,4]<- list(NULL)

WR2$Position<-rep("WR",nrow(WR2))


names(WR2)[3]= "Name"


###########################TEnd#############################################
TEnd_url=paste("https://www.numberfire.com/nfl/daily-fantasy/daily-football-projections/TE")
sitePage=htmlParse(TEnd_url)
TEndStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(TEndStats.Table)[2]= "Name"
names(TEndStats.Table)[15]= "Points"
names(TEndStats.Table)[16]= "Cost"

TEndStats.Table[3:14] <- list(NULL)
TEndStats.Table[5] <- list(NULL)
TEndStats.Table[1] <- list(NULL)


TEnd2<-cSplit(TEndStats.Table,"Name", sep= "(", type.convert=FALSE)

TEnd2[,4]<- list(NULL)

TEnd2$Position<-rep("3B",nrow(TEnd2))


names(TEnd2)[3]= "Name"


########################Kicker############################

Kicker_url=paste("https://www.numberfire.com/nfl/daily-fantasy/daily-football-projections/K")
sitePage=htmlParse(Kicker_url)
KickerStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(KickerStats.Table)[2]= "Name"
names(KickerStats.Table)[15]= "Points"
names(KickerStats.Table)[16]= "Cost"

KickerStats.Table[3:14] <- list(NULL)
KickerStats.Table[5] <- list(NULL)
KickerStats.Table[1] <- list(NULL)

Kicker2<-cSplit(KickerStats.Table,"Name", sep= "(", type.convert=FALSE)

Kicker2[,4]<- list(NULL)

Kicker2$Position<-rep("Kicker",nrow(Kicker2))


names(Kicker2)[3]= "Name"


#############################Defense########################################

Defense_url=paste("https://www.numberfire.com/nfl/daily-fantasy/daily-football-projections/D")
sitePage=htmlParse(Defense_url)
DefenseStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(DefenseStats.Table)[2]= "Name"
names(DefenseStats.Table)[14]= "Points"
names(DefenseStats.Table)[15]= "Cost"

DefenseStats.Table[3:13] <- list(NULL)
DefenseStats.Table[5] <- list(NULL)
DefenseStats.Table[1] <- list(NULL)


Defense2<-cSplit(DefenseStats.Table,"Name", sep= "(", type.convert=FALSE)


Defense2[,4]<- list(NULL)

Defense2$Position<-rep("Defense",nrow(Defense2))


names(Defense2)[3]= "Name"

# P2<-cSplit(P2,"Name", sep= " ", type.convert=FALSE)


##Starting Pitcher
# SP_url=paste("http://espn.go.com/mlb/probables")
# sitePage=htmlParse(SP_url)
# SPStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)
# 
# 
# names(SPStats.Table)[1]= "Name"
# 
# SP2<-cSplit(SPStats.Table,"Name", sep= ".", type.convert=FALSE)
# SP2<-cSplit(SP2,"Name_2", sep= "(", type.convert=FALSE)
# 
# SP2[,1:16]<-list(NULL)
# SP2[,2]<-list(NULL)
# 
# for (i in 1:nrows(P2)){
#   for (i in 1:nrows(SP2)){
#   if P2$Name_2 = SP2$Name_2_1 {
#     P2$Name_3=1
#   else
#   }
# }


#########################################Flex#########################################

Flex_url=paste("https://www.numberfire.com/nfl/daily-fantasy/daily-football-projections/RBWR")
sitePage=htmlParse(Flex_url)
FlexStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(FlexStats.Table)[2]= "Name"
names(FlexStats.Table)[15]= "Points"
names(FlexStats.Table)[16]= "Cost"

FlexStats.Table[3:14] <- list(NULL)
FlexStats.Table[5] <- list(NULL)
FlexStats.Table[1] <- list(NULL)


Flex2<-cSplit(FlexStats.Table,"Name", sep= "(", type.convert=FALSE)

Flex2[,4]<- list(NULL)

Flex2$Position<-rep("Flex",nrow(Flex2))


names(Flex2)[3]= "Name"

Stats<- rbind(QB2,RB2,TEnd2,WR2,Kicker2,Defense2,Flex2)

#Stats2<-cSplit(Stats,"Name", sep= "(", type.convert=FALSE)

#Stats3<-cSplit(Stats2,"Name_2", sep= ",", type.convert=FALSE)

#Stats3[,5] <- list(NULL)

# names(Stats3)[4]= "Position"
# names(Stats3)[3]= "Name"


# Start_url=paste("http://www.fantasyalarm.com/lineups/mlb/")
# sitePage=htmlParse(Start_url)
# StartStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)





write.csv(Stats,file = "NFL.csv")
# write.csv(SP2,file = "SP.csv")
