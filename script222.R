#Webscrapping amazon...
#Para cada aspiradora...
url<-"https://www.amazon.es/s?k=aspirador&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2"
#Leemos la web
pagina_web <- read_html(url)
#Identificamos el selector del scoring
links<-" div:nth-child(1) > div > div > div:nth-child(1) > h2 > a"
#Obtenemos el nodo   
links_html <- html_nodes(pagina_web,links)
#Lo convertimos a textol
links_texto <-html_attr(links_html,"href")
links_texto


##Paginacion
#Pinchar sobre pagina dos y pagina 3 el enlace
# https://www.amazon.es/s?k=aspirador&page=2&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1558606598&ref=sr_pg_2
# https://www.amazon.es/s?k=aspirador&page=3&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1558606598&ref=sr_pg_3
pagina<-"#search > div.sg-row > div.sg-col-20-of-24.sg-col-28-of-32.sg-col-16-of-20.sg-col.s-right-column.sg-col-32-of-36.sg-col-8-of-12.sg-col-12-of-16.sg-col-24-of-28 > div > span:nth-child(9) > div > div > div > ul > li:nth-child(3) > a"
paginacion <- html_nodes(pagina_web,pagina)
#Lo convertimos a textol
pag1 <-html_attr(paginacion,"href")
pag1
#[1] "//s?k=aspirador&page=2&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1558605934&ref=sr_pg_2"
# Probar a sustituir 2 por 3!
lista_paginas<-c(1:5)
pag<-str_replace(pag1, "page=2",paste0("page=",lista_paginas))
pag<-str_replace(pag, "sr_pg_2",paste0("sr_pg_",lista_paginas))

paginastotales<-paste0("https://www.amazon.es", pag)

#Lo ideal hacer una funcion para que a partir de cada pagina nos de los links

dameLinksPagina<-function(url){
  #Leemos la web
  pagina_web <- read_html(url)
  #Identificamos el selector del scoring
  links<-" div:nth-child(1) > div > div > div:nth-child(1) > h2 > a"
  #Obtenemos el nodo   
  links_html <- html_nodes(pagina_web,links)
  #Lo convertimos a textol
  links_texto <-html_attr(links_html,"href")
  links_texto
}
#Comproabmos que funciona
test<-dameLinksPagina(paginastotales[1])
test

#Obtenemos todos los linkns de 5 paginas 
linksAsp<-sapply(paginastotales, dameLinksPagina)
vlinkAsp<-paste0("https://www.amazon.es",as.vector(res))


###################
###################


##Que información queremos sacar de cada uno??
# Nombre, puntuacion, precio, peso, dimensiones, potencia
# Por ejemplo para : https://www.amazon.es/Bosch-BGS5SIL66B-Relaxxx-ProSilence-SensorBagless/dp/B00LWVGMPS/ref=sr_1_15?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=aspirador&qid=1558604067&s=gateway&sr=8-15
url<-"https://www.amazon.es/Cecotec-Conga-Duostick-Easy-Aspirador/dp/B01LYTA8KW/ref=sr_1_5?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=aspirador&qid=1558782933&s=gateway&sr=8-5"
#Leemos la web
pagina_web <- read_html(url)

#Identificamos el selector del NOMBRE
nombre<-"#productTitle"
#Obtenemos el nodo
nombre_html <- html_nodes(pagina_web,nombre)
#Lo convertimos a texto
nombre_texto <- html_text(nombre_html)
nombre_texto

#Identificamos el selector del scoring

# # process it with phantomjs
# 
# command<-paste("/home/ines/aux/crea ", "'",url,"'", sep="")
# system(command)
# page_html <- read_html("techstars.html")
# 
# 
# scoring<-"#a-popover-content-5 > div > div > div > div.a-section.a-spacing-small.a-text-center > span"
# scor_html <- html_nodes(page_html,scoring)
# scor_texto <- html_text(scor_html)
# scor_texto

#Tabla info:
tabla<-"#prodDetails > div.wrapper.ESlocale > div.column.col1 > div:nth-child(1) > div.content.pdClearfix > div > div > table"
tabla_html <- html_nodes(pagina_web,tabla)
tabla <- html_table(tabla_html)
tabla
class(tabla)
tab<-t(tabla[[1]])
colnames(tab[1,])
mitab<-data.frame(t(tab[2,-14]))
colnames(mitab)<-tab[1,-14]
mitab


#Numero de opiniones
NumOp<-"#acrCustomerReviewText"
NumOp_html <- html_nodes(pagina_web,NumOp)
NumOp_texto <- html_text(NumOp_html)
NumOp_texto

#El precio
precio<-"#priceblock_ourprice"
precio_html<-html_nodes(pagina_web, precio)
precio_texto<-html_text(precio_html)
precio_texto

#Si lo juntamos todo:
articulo<-c(nombre_texto, as.character(mitab$`Peso del producto`[1]), as.character(mitab$`Dimensiones del producto`[1]), as.character(mitab$Capacidad[1]),as.character(mitab$Potencia[1]), NumOp_texto, scor_texto, precio_texto)  

ar##############################################


#Hacemos una funcion para cada link recopilado

getArticulo<-function(url){
  print(url)
  pagina_web <- read_html(url)
  #Identificamos el selector del NOMBRE
  nombre<-"#productTitle"
  #Obtenemos el nodo
  nombre_html <- html_nodes(pagina_web,nombre)
  #Lo convertimos a texto
  nombre_texto <- html_text(nombre_html)
  nombre_texto
  
  
  #Tabla info:
  tabla<-"#prodDetails > div.wrapper.ESlocale > div.column.col1 > div:nth-child(1) > div.content.pdClearfix > div > div > table"
  tabla_html <- html_nodes(pagina_web,tabla)
  tabla <- html_table(tabla_html)
  tabla
  
  if( length(tabla)==0 ){
    col<-c("Peso del producto","Dimensiones del producto","Capacidad","Potencia")
    mitab<-data.frame(colnames(col))
    mitab<-rbind(mitab, c("0","0","0","0"))
    colnames(mitab)<-col
    # class(tabla)
    # tab<-t(tabla[[1]])
    # colnames(tab[1,])
    # mitab<-data.frame(t(tab[2,-14]))
    # colnames(mitab)<-tab[1,-14]
  }else{
    col<-c("Peso del producto","Dimensiones del producto","Capacidad","Potencia")
    colnames(mitab)<-col
    mitab<-rbind(mitab, c("0","0","0","0"))
    # colnames(mitab)<-col
    a<-do.call("rbind", tabla) #Convertimos a matrix e invertimos
    tablaconv<-t(a)
    colnames(tablaconv)<-tablaconv[1,] #Ponesmo vlores a las columnas
    tabldf<-as.data.frame(tablaconv) #Convertimos a dataframe
    tabldf<-tabldf[-1,]  #QUitamos primera fila valores de colnames
    #mitab<-data.frame(colnames(col))
    peso<-as.character(tabldf$`Peso del producto`[1])
    dimensiones<- as.character(tabldf$`Dimensiones del producto`[1])
    capacidad<- as.character(tabldf$Capacidad[1])
    potencia<- as.character(tabldf$Potencia[1])
    if(length(peso)==0) peso<-"0"
    if(length(dimensiones)==0) dimensiones<-"0"
    if(length(capacidad)==0) capacidad<-"0"
    if(length(potencia)==0) potencia<-"0"
    #Creamos dataframes de 0 y luego sustituimos valores
    zero<-matrix("0", ncol=4, nrow=1)
    dfzero<-data.frame(zero)
    colnames(dfzero)<-col
    #Convertimos todo a character
    dfzero[, ] <- lapply(dfzero[, ], as.character)
    #Asignamos valores
    dfzero$`Peso del producto`<-peso
    dfzero$`Dimensiones del producto`<-dimensiones
    dfzero$Capacidad<-capacidad
    dfzero$Potencia<-potencia
    mitab<-dfzero
        }
  
  #Numero de opiniones
  NumOp<-"#acrCustomerReviewText"
  NumOp_html <- html_nodes(pagina_web,NumOp)
  NumOp_texto <- html_text(NumOp_html)
  NumOp_texto
  
  #El precio
  precio<-"#priceblock_ourprice"
  precio_html<-html_nodes(pagina_web, precio)
  precio_texto<-html_text(precio_html)
  precio_texto
  
  #Si lo juntamos todo:
  articulo<-c(nombre_texto, as.character(mitab$`Peso del producto`[1]), as.character(mitab$`Dimensiones del producto`[1]), as.character(mitab$Capacidad[1]),as.character(mitab$Potencia[1]), NumOp_texto, scor_texto, precio_texto)  
  
  articulo
  
}

#Probamos para uno
url<-vlinkAsp[1]
getArticulo(url)


#Obtenemos toda la caracterizacion de los articulos
res<-sapply(vlinkAsp,getArticulo)
#Generamos un dataframe con esa info
a<-do.call("rbind", res)
aspiradoras<-as.data.frame(a)
colnames(a)<-c("nombre", "peso" , "dimensiones", "capacidad","potencia", "opiniones", "precio")  
write.csv(a, "/home/ines/platzi/dataAmazon.csv")




