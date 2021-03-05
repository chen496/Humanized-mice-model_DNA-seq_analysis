

aa<-array(0,c(1,5))
ab<-array(1,c(1,5))
ac<-array(2,c(1,5))

ss<-c(aa,ab,ac)
ss

aa[1,2]

c<-list(a,b)
c

c[[1]][1]
c[[2]][3]

h <- hash( keys=letters, values=1:26 )
h <- hash( letters, 1:26 )
h
t<-"a"
for(i in 1:length(h)){
  h[letters[i]]<-c(0,0,0)
}

h
c<-as.list(h)

c[[1]]

h[[t]]<-c(1,2,3)
h[t]
h[[t]][3]

s<-list(a,b)
s


