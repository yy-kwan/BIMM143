#Class5 Data Visualization 
x<-rnorm(1000)

#some summary stats
mean(x)
sd(x)
summary(x)
boxplot(x)
hist(x)
rug(x)

baby<-read.table("bimm143_05_rstats/weight_chart.txt",header = TRUE)

plot(baby$Age, baby$Weight,type="o",pch=15,cex=1.5,lwd="2",ylim=c(2,10),
     xlab="Age(months)",ylab="Weight(kg)",main="Baby weight with age", col="blue")

mouse<-read.delim("bimm143_05_rstats/feature_counts.txt",header=TRUE)
barplot(mouse$Count, names.arg = mouse$Feature, horiz=TRUE, ylab="", 
        main="Number of features in the mouseGRCm38 genome",las=1,xlim=c(0,8000))
par(mar=c(3.1,11.1,4.1,2))

mf<-read.delim("bimm143_05_rstats/male_female_counts.txt", header=TRUE)

barplot(mf$Count, names.arg = mf$Sample, col=c("blue2","red2"),las=2,ylab="Count")
