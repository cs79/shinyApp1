## define financial ratio calculation functions
#current ratio
curRat <- function(curAssets, curLiab) {round(curLiab/curAssets, 2) }
#quick ratio
qRat <- function(curAssets, inv, curLiab) { round((curAssets-inv)/curLiab, 2) }
#working capital ratio
wcRat <- function(curAssets, curLiab) { round(curAssets/curLiab, 2) }
#debt ratio
debtRat <- function(assets, liab) { round(liab/assets, 2) }

##define threshhold checker functions
aboveThreshCheck <- function(thresh, level) { if(thresh < level) {
        return("WARNING: Threshold Exceeded")
} else if(level/thresh > .85) {
        return("NOTICE: Approaching Threshold")
} else {
        return("OK")
}}

belowThreshCheck <- function(thresh, level) { if(thresh > level) {
        return("WARNING: Below Threshold")
} else if(thresh/level > .85) {
        return("NOTICE: Approaching Threshold")
} else {
        return("OK")
}}

## shiny server
shinyServer(
        function(input,output) {
                #calculate financial ratios from functions above
                output$curRat <- renderPrint({curRat((input$Cinput + input$ARinput + 
                                                              input$Iinput + input$OLAinput), 
                                                     input$STLinput)})
                output$qRat <- renderPrint({qRat((input$Cinput + input$ARinput + 
                                                          input$OLAinput), input$Iinput, 
                                                 input$STLinput)})
                output$wcRat <- renderPrint({wcRat((input$Cinput + input$ARinput + 
                                                            input$Iinput + input$OLAinput), 
                                                   input$STLinput)})
                output$debtRat <- renderPrint({debtRat((input$Cinput + input$ARinput + 
                                                       input$Iinput + input$OLAinput + 
                                                       input$LTAinput), 
                                              (input$STLinput + input$LTLinput))})
                #check if thresholds for ratios are being exceeded
                output$curET <- renderPrint({belowThreshCheck(input$curThresh, curRat((input$Cinput + input$ARinput + 
                                                                                   input$Iinput + input$OLAinput), 
                                                                          input$STLinput))})
                output$qET <- renderPrint({belowThreshCheck(input$qThresh, qRat((input$Cinput + input$ARinput + 
                                                                             input$OLAinput), input$Iinput, 
                                                                    input$STLinput))})
                output$wcET <- renderPrint({belowThreshCheck(input$wcThresh, wcRat((input$Cinput + input$ARinput + 
                                                                                input$Iinput + input$OLAinput), 
                                                                       input$STLinput))})
                output$debtET <- renderPrint({aboveThreshCheck(input$debtThresh, debtRat((input$Cinput + input$ARinput + 
                                                                                      input$Iinput + input$OLAinput + 
                                                                                      input$LTAinput), 
                                                                             (input$STLinput + input$LTLinput)))})
        }
)