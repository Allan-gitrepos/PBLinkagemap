

linkmap=function(data){


require(LinkageMapView)
outfile = file.path("inst/app/www/Linkagemap.pdf")


flist <- list()
locus=data[which(data[,4]==1),1]



col   <- c("red")
flist[[1]] <- list(locus=locus,col=col)
data=data[,-4]
data=data[,c(2,3,1)]
colnames(data)=c("Group","Position","Locus" )
lmv.linkage.plot(data,outfile,mapthese=c(unique(data$Group)),
                 lcol="blue",lfont=2,lcex=1.2,rcol="black",rfont=3,rcex=2,
                 markerformatlist=flist)

}
