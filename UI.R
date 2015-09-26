library(shiny)
shinyUI(pageWithSidebar (
  headerPanel("Predicting Gasoline Car Range"),
  sidebarPanel(

    numericInput('inp_Tank', 'Enter gas tank size (in gallons)',0),
    
    checkboxGroupInput("inp_Factors", "Select the factor if it applies",
                 c(
                   "Heavy Braking/Quick Acceleration" = "1")),
    
    
   radioButtons("inp_Predict", "What would you like to predict?",
        c("City" = "1",
          "Highway" = "2",
          "Both"="3")
        ),
   
   conditionalPanel(
     condition = "input.inp_Predict == 3",
     numericInput('inp_mpgC1', 'Enter Miles/Gallon - City', 0, min = 0, max = 100,  step = 1),
     numericInput('inp_mpgH1', 'Enter Miles/Gallon - Highway', 0, min = 0, max = 100,  step = 1)
     
   ),
   
   conditionalPanel(
   condition = "input.inp_Predict == 1",
   numericInput('inp_mpgC2', 'Enter Miles/Gallon - City', 0, min = 0, max = 100,  step = 1)
                     
                       ),
   conditionalPanel(
     condition = "input.inp_Predict == 2",
     numericInput('inp_mpgH2', 'Enter Miles/Gallon - Highway', 0, min = 0, max = 100,  step = 1)
     
   )
   
   
   
   ),
    

  mainPanel(
  h3 ('Output (All metrics are in Miles)'),

  conditionalPanel(
    condition = "input.inp_Predict == 1",
    h4('City - Potential Range:'), verbatimTextOutput("out_PrerangeC2"),
    h4('City - Range lost due to factors:'), verbatimTextOutput("out_rangeAdjC2"),
    h4('City - Net Range:'), verbatimTextOutput("out_rangeC2")
    
  ),
  conditionalPanel(
    condition = "input.inp_Predict == 2",
    h4('Highway - Potential Range:'), verbatimTextOutput("out_PrerangeH2"),
    h4('Highway - Range lost due to factors:'), verbatimTextOutput("out_rangeAdjH2"),
    h4('Highway:'), verbatimTextOutput("out_rangeH2")
    
  ),
  conditionalPanel(
    condition = "input.inp_Predict == 3",
    h4('City - Potential Range:'), verbatimTextOutput("out_PrerangeC1"),
    h4('City - Range lost due to factors:'), verbatimTextOutput("out_rangeAdjC1"),
    h4('City - Net Range:'), verbatimTextOutput("out_rangeC1"),
    
    
    h4('Highway - Potential Range:'), verbatimTextOutput("out_PrerangeH1"),
    h4('Highway - Range lost due to factors:'), verbatimTextOutput("out_rangeAdjH1"),
    h4('Highway - Net Range:'), verbatimTextOutput("out_rangeH1")
    
  )
  
  

  
  )
  
  ))
