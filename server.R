library(shiny)
library(ggplot2)
library(stringr)
data<- read.csv("./Data.csv")

shinyServer(
  function(input,output){            
    output$distPlot<-renderPlot({      
      if (input$year<2012&&input$year>1949)
      {          
      ydata<-data[data$Year==input$year,] 
      ydata$EVTYPE <- str_wrap(ydata$EVTYPE, width = 10)
      ydata<-ydata[order(ydata$SumYear,decreasing=T),]
      ydata$EVTYPE <- factor(ydata$EVTYPE, levels = ydata$EVTYPE)
      qplot(data=ydata[1:10,], 
             x = EVTYPE, 
             y = SumYear, geom="bar",
             stat = "identity",fill = I("red"),
             xlab="Event Type",
             ylab="Total number",
             main=paste(" Fatalities and Injuries coursed by weather events in the United States for",input$year))
              
      }      
    }) 
    output$text1<-renderText({
      if (input$year<2012&&input$year>1949)
      {
        ydata<-data[data$Year==input$year,]        
        ydata<-ydata[order(ydata$SumYear,decreasing=T),]        
        paste("The most harmful for population health is ",ydata[1,3],"in ",input$year)
      }
      else "Please enter year from 1950-2011"
    })
  })