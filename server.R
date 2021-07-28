server = function(input, output, session) {

  # cal_hplc
  # csvがupされたら動く
  observeEvent(input$hplc_rawdata, {
    
    # csv_fileにupしたcsvを代入
    csv_file = reactive(read.csv(input$hplc_rawdata$datapath))
    # rawdataをoutputする
    output$hplc_rawdata = DT::renderDataTable(csv_file(), options = list(pageLength = 100, scrollX = TRUE, scrollY = TRUE, scrollCollapse = TRUE))

    # upしたcsvからstdをplot
    stdPlot = reactive(std_plot(data = csv_file()))
    output$stdPlot = renderPlot(stdPlot())

    # OKボタンを押したら動く
    observeEvent(input$hplc_submit, {

      stdConc = input$stdConc
      dil         = input$dil
      extVol = input$extVol

      # result_csvに計算後のcsvを代入
      result_csv = reactive(cal_hplc(std_conc = stdConc, Dil = dil, Ext_vol = extVol, data = csv_file()))
      # resultタブに結果を表示
      output$hplc_result = DT::renderDataTable(result_csv(), options = list(pageLength = 100, scrollX = TRUE, scrollY = TRUE, scrollCollapse = TRUE))
      
      output$hplc_downloadData = downloadHandler(
      filename = reactive(paste0("Result_", input$hplc_rawdata$name)),
      content = function(file) {
          
          write.csv(result_csv(), file, quote=FALSE, row.names=FALSE)
      })
    })
  })

  # tukey
  # csvがupされたら動く
  observeEvent(input$tukey_rawdata, {
    
    # csv_fileにupしたcsvを代入
    csv_file = reactive(read.csv(input$tukey_rawdata$datapath))
    # rawdataをoutputする
    output$tukey_rawdata = DT::renderDataTable(csv_file(), options = list(pageLength = 100, scrollX = TRUE, scrollY = TRUE, scrollCollapse = TRUE))

    observeEvent(input$tukey_table_submit, {
      
      Level = input$tukey_p

      result_csv = reactive(tukey_table(data = csv_file(), level = Level))

      output$tukey_table_result = DT::renderDataTable(result_csv(), options = list(pageLength = 100, scrollX = TRUE, scrollY = TRUE, scrollCollapse = TRUE))

      output$tukey_downloadData = downloadHandler(
      filename = reactive(paste0("Tukey_", input$tukey_rawdata$name)),
      content = function(file) {
          
          write.csv(result_csv(), file, quote=FALSE, row.names=FALSE)
      })
    })
  })

  # two-way_ANOVA
  # csvがupされたら動く
  observeEvent(input$tw_anova_rawdata, {
    
    # csv_fileにupしたcsvを代入
    csv_file = reactive(read.csv(input$tw_anova_rawdata$datapath))
    # rawdataをoutputする
    output$tw_anova_rawdata = DT::renderDataTable(csv_file(), options = list(pageLength = 100, scrollX = TRUE, scrollY = TRUE, scrollCollapse = TRUE))

    result_csv = reactive(tw_anova_table(data = csv_file()))

    output$tw_anova_table_result = DT::renderDataTable(result_csv(), options = list(pageLength = 100, scrollX = TRUE, scrollY = TRUE, scrollCollapse = TRUE))

    output$tw_anova_downloadData = downloadHandler(
    filename = reactive(paste0("tw_anova_", input$tw_anova_rawdata$name)),
    content = function(file) {
        
        write.csv(result_csv(), file, quote=FALSE, row.names=FALSE)
    })
  })

}