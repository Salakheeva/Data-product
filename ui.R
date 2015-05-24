library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Analysis of weather events in the United States"),
  sidebarPanel(
    h3('Documentation'),
    p('The events in the database start in the year 1950 and end in November 2011. 
      In the earlier years of the database there are generally fewer events recorded, 
      most likely due to a lack of good records. 
      More recent years should be considered more complete.'),
    p('The data analysis of weather events in the United States was performed. This application answer a questions:
        which type of events are most harmful in the choosen year with respect to population health.'),
    p('Please choose a year:'),
    numericInput('year','Year',2011,min=1950,max=2011,step=1),
    submitButton('Submit')
    ),
  mainPanel(
    plotOutput("distPlot"),
    textOutput('text1')
  )
  ))