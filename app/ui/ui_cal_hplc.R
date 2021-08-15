ui_cal_hplc =
  sidebarLayout(
    sidebarPanel(
      fileInput("hplc_rawdata", "CSVファイルを選択して下さい",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      numericInput("stdConc", "STD濃度 (ppm)", 10),
      numericInput("dil", "希釈倍率", 1.25),
      numericInput("extVol", "抽出時の溶媒量 (mL)", 5),
      actionButton("hplc_submit", "計算"),
      downloadButton('hplc_downloadData', '計算結果のダウンロード'),
      tags$a(href = "https://github.com/tonegawa07/Lab_app_2/blob/master/app/README.md#anchor2-1", "操作方法はこちら", target="_blank", rel="noopener")
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("生データ", DT::dataTableOutput('hplc_rawdata')),
                  tabPanel("STD確認用プロット", plotOutput("stdPlot", width = 500)),
                  tabPanel("計算結果", DT::dataTableOutput("hplc_result"))
      )
    )
  )
