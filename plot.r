a = read.csv('a',header=FALSE)
png("a.png", width=200, height=200, bg="transparent")
plot(a$V1,a$V2,col=sapply(a$V3,toString),pch=19,lwd=10)
dev.off()

a_ = read.csv('a_',header=FALSE)
png("a_.png", width=200, height=200, bg="transparent")
plot(a_$V1,a_$V1,col=sapply(a_$V2,toString),pch=19,lwd=10)
dev.off()
