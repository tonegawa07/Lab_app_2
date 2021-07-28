ui_tw_anova = 
  sidebarLayout(
    sidebarPanel(
      fileInput("tw_anova_rawdata", "Choose CSV File",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      downloadButton('tw_anova_downloadData', 'Download'),
      tags$a(href = "https://github.com/tonegawa07/Lab_app/blob/master/README.md#anchor2-2-2", "How to use", target="_blank", rel="noopener")

    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("rawdata", DT::dataTableOutput('tw_anova_rawdata')),
                  tabPanel("Two-way ANOVA table ", DT::dataTableOutput('tw_anova_table_result'))
      )
    )
  )