ui_cal_hplc =
  sidebarLayout(
    sidebarPanel(
      fileInput("hplc_rawdata", "Choose CSV File",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      numericInput("stdConc", "STD conc. (ppm)", 10),
      numericInput("dil", "Dilution", 1.25),
      numericInput("extVol", "Extraction vol (mL)", 5),
      actionButton("hplc_submit", "Calculation"),
      downloadButton('hplc_downloadData', 'Download'),
      tags$a(href = "https://github.com/tonegawa07/Lab_app/blob/master/README.md#anchor2-1", "How to use", target="_blank", rel="noopener")
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("rawdata", DT::dataTableOutput('hplc_rawdata')),
                  tabPanel("std plot", plotOutput("stdPlot", width = 500)),
                  tabPanel("result", DT::dataTableOutput("hplc_result"))
      )
    )
  )
