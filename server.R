library (shiny)
Range <- function (mpg,tank)
{
  mpg*tank
}
RangeReduction <- function (mpg, tank, CityFlag,option=NULL)
{
 if (is.null(option))
 {
   factor<-0
 } else
 {
   
   factor<-ifelse (CityFlag==1, 0.05,0.33)
 }

  
  Range(mpg,tank)* factor
}

TotalRange <- function (mpg,tank,option,request)
{
  Range(mpg,tank) - RangeReduction(mpg, tank, option,request)
}




shinyServer(
  function (input, output)
  {
    output$out_Tank <- renderPrint( {input$inp_Tank})
    output$out_Factors <- renderPrint( {input$inp_Factors})
    output$out_Predict <- renderPrint( {input$inp_Predict})
    
    output$out_PrerangeC1 <- renderPrint({Range(input$inp_mpgC1,input$inp_Tank)})
    output$out_rangeAdjC1 <- renderPrint({RangeReduction(input$inp_mpgC1,input$inp_Tank,1,input$inp_Factors)})
    output$out_rangeC1 <- renderPrint( {TotalRange(input$inp_mpgC1,input$inp_Tank,1,input$inp_Factors )})
    
    
    output$out_PrerangeH1 <- renderPrint({Range(input$inp_mpgH1,input$inp_Tank)})
    output$out_rangeAdjH1 <- renderPrint({RangeReduction(input$inp_mpgH1,input$inp_Tank,0,input$inp_Factors)})
    output$out_rangeH1 <- renderPrint( {TotalRange(input$inp_mpgH1,input$inp_Tank,0,input$inp_Factors )})
    
    
    
    output$out_PrerangeC2 <- renderPrint({Range(input$inp_mpgC2,input$inp_Tank)})
    output$out_rangeAdjC2 <- renderPrint({RangeReduction(input$inp_mpgC2,input$inp_Tank,1,input$inp_Factors)})
    output$out_rangeC2 <- renderPrint( {TotalRange(input$inp_mpgC2,input$inp_Tank,1,input$inp_Factors )})
    
    
    output$out_PrerangeH2 <- renderPrint({Range(input$inp_mpgH2,input$inp_Tank)})
    output$out_rangeAdjH2 <- renderPrint({RangeReduction(input$inp_mpgH2,input$inp_Tank,0,input$inp_Factors)})
    output$out_rangeH2 <- renderPrint( {TotalRange(input$inp_mpgH2,input$inp_Tank,0,input$inp_Factors )})
    


    

  
  }
  )