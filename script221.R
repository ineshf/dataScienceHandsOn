##Instalacion del paquete:
install.packages("rvest")
#Cargamos el paquete:
library(rvest)

## Vamos a hacer un ejemplo con la web de idbm, queremos obtener el rating de wonderwoman
url<-"https://www.imdb.com/title/tt0451279/?ref_=nv_sr_1?ref_=nv_sr_1"
#Leemos la web
pagina_web <- read_html(url)
#Identificamos el selector del scoring
scoring<-"#title-overview-widget > div.vital > div.title_block > div > div.ratings_wrapper > div.imdbRating > div.ratingValue > strong > span"
#Obtenemos el nodo
scoring_html <- html_nodes(pagina_web,scoring)
#Lo convertimos a texto
scoring_texto <- html_text(scoring_html)
scoring_texto


#Veamos con tablas como funciona
tabla<-"#titleCast > table"
tabla_html <- html_nodes(pagina_web,tabla)
#SI lo aplicamos como texto
tabla <- html_text(tabla_html)
tabla
#SI lo usamos como tabla
tabla <- html_table(tabla_html)
tabla
class(tabla)

