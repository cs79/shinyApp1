shinyUI(pageWithSidebar(
                headerPanel("Financial KPI Tracking Tool"),
                sidebarPanel(
                        #assets
                        h3("Financial Data Entry"),
                        h4("Assets"),
                        numericInput("Cinput", "Cash on Hand", value=100),
                        numericInput("ARinput", "Accounts Receivable", value=100),
                        numericInput("Iinput", "Inventory", value=100),
                        numericInput("OLAinput", "Other Liquid Assets", value=100),
                        numericInput("LTAinput", "Long-term Assets", value=100),
                        #liabilities
                        h4("Liabilities"),
                        numericInput("STLinput", "Short-term Liabilities", value=100),
                        numericInput("LTLinput", "Long-term Liabilities", value=100),
                        #kpi thresholds
                        h3("Set KPI Alert Thresholds"),
                        h4("(in percent)"),
                        sliderInput("curThresh", "Current Ratio Threshold", value=1.9, min=0, max=5, step=0.1),
                        sliderInput("qThresh", "Quick Ratio Threshold", value=0.9, min=0, max=5, step=0.1),
                        sliderInput("wcThresh", "Working Capital Ratio Threshold", value=0.9, min=0, max=5, step=0.1),
                        sliderInput("debtThresh", "Debt Ratio Threshold", value=0.6, min=0, max=1, step=0.1),
                        width=5
                ),
                mainPanel(
                        h3("How to use this tool:"),
                        "In the sidebar, enter financial information about the assets and liabilities of your company.  
                        (Some default values are provided, all of which can be adjusted by entering new numbers and/or changing the sliders).
                        Then, select thresholds for financial ratios about which you would like to be alerted.  
                        For Quick Ratio and Working Capital Ratio, the threshold specified will act as a maximum for warning.  
                        For Current Ratio and Debt Ratio, the threshold will act as a minimum for warning.
                        The application will also give you a notice if you are approaching a threshold, 
                        but have not yet crossed it.",
                        h4("Current Ratio:"),
                        verbatimTextOutput("curRat"),
                        h4("Ratio Status:"),
                        verbatimTextOutput("curET"),
                        br(),
                        h4("Quick Ratio:"),
                        verbatimTextOutput("qRat"),
                        h4("Ratio Status:"),
                        verbatimTextOutput("qET"),
                        br(),
                        h4("Working Capital Ratio:"),
                        verbatimTextOutput("wcRat"),
                        h4("Ratio Status:"),
                        verbatimTextOutput("wcET"),
                        br(),
                        h4("Debt Ratio:"),
                        verbatimTextOutput("debtRat"),
                        h4("Ratio Status:"),
                        verbatimTextOutput("debtET"),
                        width=7
                )
        )
)