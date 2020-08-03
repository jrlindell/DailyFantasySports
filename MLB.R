# install.packages("xlsx")
# install.packages("lpSolve")
# install.packages("splitstackshape")


library(XML)
library(utils)
library(car)
library(splitstackshape)
library(lpSolve)
library(xlsx)
library(fastR)


##oneB
oneB_url=paste("http://www.numberfire.com/mlb/daily-fantasy/daily-baseball-projections/1B")
sitePage=htmlParse(oneB_url)
oneBStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)
View(oneBStats.Table)

names(oneBStats.Table)[2]= "Name"
names(oneBStats.Table)[15]= "Points"
names(oneBStats.Table)[16]= "Cost"

oneBStats.Table[3:14] <- list(NULL)
oneBStats.Table[5] <- list(NULL)
oneBStats.Table[1] <- list(NULL)


oneB2<-cSplit(oneBStats.Table,"Name", sep= "(", type.convert=FALSE)

oneB2[,4]<- list(NULL)

oneB2$Position<-rep("1B",nrow(oneB2))


names(oneB2)[3]= "Name"

##twoB
twoB_url=paste("http://www.numberfire.com/mlb/daily-fantasy/daily-baseball-projections/2B")
sitePage=htmlParse(twoB_url)
twoBStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(twoBStats.Table)[2]= "Name"
names(twoBStats.Table)[15]= "Points"
names(twoBStats.Table)[16]= "Cost"

twoBStats.Table[3:14] <- list(NULL)
twoBStats.Table[5] <- list(NULL)
twoBStats.Table[1] <- list(NULL)


twoB2<-cSplit(twoBStats.Table,"Name", sep= "(", type.convert=FALSE)

twoB2[,4]<- list(NULL)

twoB2$Position<-rep("2B",nrow(twoB2))


names(twoB2)[3]= "Name"

##SS
SS_url=paste("http://www.numberfire.com/mlb/daily-fantasy/daily-baseball-projections/SS")
sitePage=htmlParse(SS_url)
SSStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(SSStats.Table)[2]= "Name"
names(SSStats.Table)[15]= "Points"
names(SSStats.Table)[16]= "Cost"

SSStats.Table[3:14] <- list(NULL)
SSStats.Table[5] <- list(NULL)
SSStats.Table[1] <- list(NULL)


SS2<-cSplit(SSStats.Table,"Name", sep= "(", type.convert=FALSE)

SS2[,4]<- list(NULL)

SS2$Position<-rep("SS",nrow(SS2))


names(SS2)[3]= "Name"

##threeB
threeB_url=paste("http://www.numberfire.com/mlb/daily-fantasy/daily-baseball-projections/3B")
sitePage=htmlParse(threeB_url)
threeBStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(threeBStats.Table)[2]= "Name"
names(threeBStats.Table)[15]= "Points"
names(threeBStats.Table)[16]= "Cost"

threeBStats.Table[3:14] <- list(NULL)
threeBStats.Table[5] <- list(NULL)
threeBStats.Table[1] <- list(NULL)


threeB2<-cSplit(threeBStats.Table,"Name", sep= "(", type.convert=FALSE)

threeB2[,4]<- list(NULL)

threeB2$Position<-rep("3B",nrow(threeB2))


names(threeB2)[3]= "Name"

##OF
OF_url=paste("http://www.numberfire.com/mlb/daily-fantasy/daily-baseball-projections/OF")
sitePage=htmlParse(OF_url)
OFStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(OFStats.Table)[2]= "Name"
names(OFStats.Table)[15]= "Points"
names(OFStats.Table)[16]= "Cost"

OFStats.Table[3:14] <- list(NULL)
OFStats.Table[5] <- list(NULL)
OFStats.Table[1] <- list(NULL)

OF2<-cSplit(OFStats.Table,"Name", sep= "(", type.convert=FALSE)

OF2[,4]<- list(NULL)

OF2$Position<-rep("OF",nrow(OF2))


names(OF2)[3]= "Name"


##P
P_url=paste("http://www.numberfire.com/mlb/daily-fantasy/daily-baseball-projections/pitchers")
sitePage=htmlParse(P_url)
PStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(PStats.Table)[2]= "Name"
names(PStats.Table)[14]= "Points"
names(PStats.Table)[15]= "Cost"

PStats.Table[3:13] <- list(NULL)
PStats.Table[5] <- list(NULL)
PStats.Table[1] <- list(NULL)


P2<-cSplit(PStats.Table,"Name", sep= "(", type.convert=FALSE)


P2[,4]<- list(NULL)

P2$Position<-rep("P",nrow(P2))


names(P2)[3]= "Name"

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

##C
C_url=paste("http://www.numberfire.com/mlb/daily-fantasy/daily-baseball-projections/C")
sitePage=htmlParse(C_url)
CStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)


names(CStats.Table)[2]= "Name"
names(CStats.Table)[15]= "Points"
names(CStats.Table)[16]= "Cost"

CStats.Table[3:14] <- list(NULL)
CStats.Table[5] <- list(NULL)
CStats.Table[1] <- list(NULL)


C2<-cSplit(CStats.Table,"Name", sep= "(", type.convert=FALSE)

C2[,4]<- list(NULL)

C2$Position<-rep("C",nrow(C2))


names(C2)[3]= "Name"

Stats<- rbind(oneB2,twoB2,threeB2,SS2,OF2,P2,C2)

#Stats2<-cSplit(Stats,"Name", sep= "(", type.convert=FALSE)

#Stats3<-cSplit(Stats2,"Name_2", sep= ",", type.convert=FALSE)

#Stats3[,5] <- list(NULL)

# names(Stats3)[4]= "Position"
# names(Stats3)[3]= "Name"


# Start_url=paste("http://www.fantasyalarm.com/lineups/mlb/")
# sitePage=htmlParse(Start_url)
# StartStats.Table = readHTMLTable(sitePage, trim=T, header=F, which=1)





write.csv(Stats,file = "mlb.csv")
# write.csv(SP2,file = "SP.csv")
