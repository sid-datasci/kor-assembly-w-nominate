library(wnominate)
library(pscl)
csv <- read.csv("vote_table_num.csv", header=TRUE)
member.no <- as.character(csv[,1])
member.no <- matrix(member.no)
csv <- csv[,-c(1)]
data <- data.frame(t(csv[-1]))
colnames(data) <- member.no
party <- read.csv("member_no_party.csv")
party.info <- party[,1]
party.info <- matrix(party.info)
colnames(party.info) <- "party"
rc <- rollcall(csv, yea=c(1), nay=c(2, 3), missing=c(0), notInLegis = c(4), legis.names = member.no, legis.data = party.info)
result <- wnominate(rc, polarity=c(1,1))
