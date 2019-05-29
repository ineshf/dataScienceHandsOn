pageWithSidebar(
  headerPanel('Amazon k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(data), selected=names(data)[[4]]),
    selectInput('ycol', 'Y Variable', names(data),
                selected=names(data)[[3]]),
    numericInput('clusters', 'Numero de clusters', 3,
                 min = 1, max = 9)
  ),
  mainPanel(
    plotOutput('plot1')
  )
)