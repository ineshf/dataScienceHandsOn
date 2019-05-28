url<-"https://www.amazon.es/Bosch-BGS5SIL66B-Relaxxx-ProSilence-SensorBagless/dp/B00LWVGMPS/ref=sr_1_15?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=aspirador&qid=1558604067&s=gateway&sr=8-15"
command<-paste("/home/ines/aux/crea ", "'",url,"'", sep="")
system(command)
page_html <- read_html("techstars.html")
scoring<-"#acrPopover > span.a-declarative > a > i.a-icon.a-icon-star.a-star-4-5 > span"
scor_html <- html_nodes(page_html,scoring)
scor_texto <- html_text(scor_html)
scor_texto



page_html <- read_html("https://www.amazon.es/Aspiradora-Aspirador-Aspiradoras-Inoxidable-Boquillas/dp/B07K9JZ6SB/ref=sr_1_20?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=aspirador&qid=1558606488&s=gateway&sr=8-20")
scoring2<-"#a-popover-content-6 > div > div > div > div.a-section.a-spacing-small.a-text-center"
scor_html <- html_nodes(page_html,scoring2)
scor_texto <- html_text(scor_html)
scor_texto

"a-popover-content-6 > div > div > div > div.a-section.a-spacing-small.a-text-center > span"