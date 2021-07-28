ui_tukey = 
  sidebarLayout(
    sidebarPanel(
      fileInput("tukey_rawdata", "Choose CSV File",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      numericInput("tukey_p", "Significance level (p-value)", min = 0, max = 0.1, value = 0.05, step = 0.01),
      actionButton("tukey_table_submit", "Create a tukey table"),
      downloadButton('tukey_downloadData', 'Download'),
      tags$a(href = "https://github.com/tonegawa07/Lab_app/blob/master/README.md#anchor2-2-1", "How to use", target="_blank", rel="noopener")

    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("rawdata", DT::dataTableOutput('tukey_rawdata')),
                  tabPanel("Tukey table ", DT::dataTableOutput('tukey_table_result'))
      )
    )
  )
