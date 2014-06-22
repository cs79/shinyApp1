shinyUI(pageWithSidebar(
                headerPanel("Financial KPI Tracking Tool"),
        
                sidebarPanel(
                        #assets
                        h3("Financial Data Entry"),
                        h4("Assets"),
                        numericInput("Cinput", "Cash on Hand", value=0),
                        numericInput("ARinput", "Accounts Receivable", value=0),
                        numericInput("Iinput", "Inventory", value=0)
                        numericInput("OLAinput", "Other Liquid Assets", value=0),
                        numericInput("LTAinput", "Long-term Assets", value=0),
                        #liabilities
                        h4("Liabilities"),
                        numericInput("STLinput", "Short-term Liabilities", value=0),
                        numericInput("LTLinput", "Long-term Liabilities", value=0),
                        #kpi thresholds
                        h3("Set KPI Thresholds (percent)"),
                        
                ),
        
                mainPanel(
                        #explanation of how to use the tool
                        #outputs from calculation
                        #if i can manage it, a graph that changes colors under/over thresh
                )
        )
)