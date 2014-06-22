## define financial ratio calculation functions
#current ratio
curRat <- function(curAssets, curLiab) {round(curLiab/curAssets*100, 0) }
#quick ratio
qRat <- function(curAssets, inv, curLiab) { round((curAssets-inv)/curLiab*100, 0) }
#working capital ratio
wcRat <- function(curAssets, curLiab) { round(curAssets/curLiab*100, 0) }
#debt ratio
debtRat <- function(liab, assets) { round(liab/assets*100, 0) }

##define threshhold exceeded checker function
threshCheck <- function() {}

## shiny server
shinyServer(
        function(input,output) {
                
        }
)