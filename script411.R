####KMEANS!!
#Caculamos el numero de clusters
data<-as.data.frame(scale(data))
wss <- (nrow(data)-1)*sum(apply(data,2,var))
for (i in 2:12) wss[i] <- sum(kmeans(data, 
                                     centers=i)$withinss)
plot(1:12, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")

#Seleccionamos 4 clusters (tentativa 4)

set.seed(20)

mydataCluster <- kmeans(data, 7, nstart =15 , iter.max = 30)
mydataCluster

#Coste de error total!
mydataCluster$tot.withinss

#par(mfrow=c(2,4))

# Create data: Cluster 1
data=as.data.frame(t(mydataCluster$centers[1,]))

data=rbind(rep(5,10) , rep(-1.5,10) , data)

# The default radar chart proposed by the library:
radarchart(data)

# Custom the radarChart !
radarchart( data  , axistype=1 , 
            
            #custom polygon
            pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
            
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
            
            #custom labels
            vlcex=0.8 
)




# Create data: Cluster 2
data=as.data.frame(t(mydataCluster$centers[2,]))

data=rbind(rep(5,10) , rep(-1.5,10) , data)

# The default radar chart proposed by the library:
radarchart(data)

# Custom the radarChart !
radarchart( data  , axistype=1 , 
            
            #custom polygon
            pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
            
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
            
            #custom labels
            vlcex=0.8 
)

# Create data: Cluster 3
data=as.data.frame(t(mydataCluster$centers[3,]))

data=rbind(rep(5,10) , rep(-1.5,10) , data)

# The default radar chart proposed by the library:
radarchart(data)

# Custom the radarChart !
radarchart( data  , axistype=1 , 
            
            #custom polygon
            pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
            
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
            
            #custom labels
            vlcex=0.8 
)

# Create data: Cluster 4
data=as.data.frame(t(mydataCluster$centers[4,]))

data=rbind(rep(5,10) , rep(-1.5,10) , data)

# The default radar chart proposed by the library:
radarchart(data)

# Custom the radarChart !
radarchart( data  , axistype=1 , 
            
            #custom polygon
            pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
            
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
            
            #custom labels
            vlcex=0.8 
)


#####################33

#######################
colnames(aspiradoras)
data<-aspiradoras[,-1]
colnames(data)
rownames(data)<-c(1:100)
data<-as.data.frame(scale(data))
mydataCluster <- kmeans(data, 4, nstart =15 , iter.max = 50)
mydataCluster
cent<-as.data.frame(mydataCluster$centers)

library(fmsb)
values=rbind(rep(5,10) , rep(-1.5,10) , cent)
radarchart(values)



library(ggplot2)
ggplot(data, aes(capacidad, potencia, color = opiniones)) + geom_point()

ic <- as.factor(mydataCluster$cluster)
ggplot(data, aes(peso, opiniones, color = ic)) + geom_point()


