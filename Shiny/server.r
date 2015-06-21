library(shiny)
library(caret)
library(HistData)


aveheight <- function(momheight,dadheight) (momheight+dadheight)/2



 predictHieght<-function(averageHeight)
 {
  data(Galton)
  set.seed(123)
  intrain <- createDataPartition(Galton$child,p=.6, list=F)
  training <- Galton[intrain,]
  testing <- Galton[-intrain,]
  modfit<-train(child ~ parent, data=training, method = "lm")
  pred <-predict(modfit,data.frame(parent = averageHeight))
  return(pred)
 }

shinyServer(
  function(input,output)
  {
  averageHeight <-eventReactive(input$goButton,{ aveheight(input$momheight,input$dadheight)})
  output$aveheight <- renderPrint(averageHeight())
  output$maleprediction <- renderPrint(predictHieght(averageHeight()))
  output$femaleprediction <- renderPrint(predictHieght(averageHeight())/1.08)
  }
)