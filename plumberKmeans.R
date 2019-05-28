# plumberKmeans.R

iris.km <- kmeans(iris[, -5], 3, iter.max = 30)

#* Devuelve los centros de cada cluster
#* @param centros numero del cluster a obtener centroides
#* @get /cluster
function(centros=""){
  #list(msg =  iris.km$centers[centros,])
  iris.km$centers[centros,]
}

#* Devuelve el cluster al que asociar el nuevo valor
#* @sepal.Length
#* @sepal.Width
#* @petal.Length
#* @petal.Width
#* @post /getCluster
function(sl, sw, pl,pw){
  #values<-c(6.3, 2.5, 5.0, 1.9)
  values<-c(as.numeric(sl),as.numeric(sw),as.numeric(pl),as.numeric(pw))
  val1<-iris.km$centers[1,]
  res1<-sum(values^2-val1^2)^2
  val2<-iris.km$centers[2,]
  res2<-sum(values^2-val2^2)^2
  val3<-iris.km$centers[3,]
  res3<-(sum(values^2-val3^2))^2
  valortotal<-c(res1, res2, res3)
  pos<-which.min(valortotal)
  paste0("Cluster ",pos," con valores: ")
  iris.km$centers[pos,]
}
#curl "http://localhost:8000/getCluster?sepal.Length=6.3&sepal.Width=2.5&petal.Length=5.0&petal.Width=1.9"
