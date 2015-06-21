library(shiny)

shinyUI(pageWithSidebar(
  headerPanel(tags$div("Creating Data Products Course Assignment", tags$br(),"Predicting child height")),
  sidebarPanel(
    helpText("Put in Mother's and Father's height in inches and press submit to get the predicted height of their children."),
    numericInput("momheight","Height of Mother (in.)", ((64+73)/2),min=64,max=73, step=.5),
    numericInput("dadheight","Height of Father (in.)", ((64+73)/2),min=64,max=73, step=.5),
    actionButton("goButton","Submit")
  ),
  mainPanel(
   h3("Average Height of Parents (in.)"),
   verbatimTextOutput("aveheight"),
   h3("Predicted Height of Male Child (in.)"),
   verbatimTextOutput("maleprediction"),
   h3("Predicted Height of Female Child (in.)"),
   verbatimTextOutput("femaleprediction"),
   tags$hr(),
   h4("This app was created using the Galton dataset in R.  A simple linear regression model was used to create a prediction of a child's height given the average of the mother and father's heights.  The male prediction was taken directly from the predictive model while the female prediction was calculated by taking the male prediction and dividing it by 1.08.  This was done since in the study the female children's height was mulitplied by 1.08 to make it comparable to a male height.  There is debate however weather this was appropriate and therefore assumed to be less accurate.  A different dataset where a model can be made seperately for male and female children will be done in a future update.")
  )
)
)