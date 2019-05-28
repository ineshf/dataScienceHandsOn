library(plumber)
r <- plumb("/home/ines/platzi/plumber.R")
r$run(port=8000)


#curl "http://localhost:8000/echo?msg=hello"
#curl --data "a=4&b=3" "http://localhost:8000/sum"

#Editamos un plumberKmeans.R
r <- plumb("/home/ines/platzi/plumberKmeans.R")
r$run(port=8000)
#Peticion Peticion
#curl "http://localhost:8000/cluster?centros=2" 
#curl --data "sl=4&sw=3&pl=3&pw=4" "http://localhost:8000/getCluster"
