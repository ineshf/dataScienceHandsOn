# plumber.R

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg=""){
  list(msg = paste0("El texto es: '", msg, "'"))
}

#* Plot a histogram
#* @png
#* @get /plot
function(){
  rand <- rnorm(100)
  hist(rand)
}

#* Return la suma de dos numeros
#* @param a el primero a sumar
#* @param b el segundo al sumar
#* @post /sum
function(a, b){
  as.numeric(a) + as.numeric(b)
}

