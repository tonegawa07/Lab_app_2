server = function(input, output, session) {

  # cal_hplc
  # csvがupされたら動く
  observeEvent(input$hplc_rawdata, {
    
    # csv_fileにupしたcsvを代入
    csv_file = reactive(read.csv(input$hplc_rawdata$datapath))
    # rawdataをoutputする
    output$hplc_rawdata = DT::renderDataTable(csv_file(), options = list(pageLength = 100, scrollX = TRUE, scrollY = TRUE, scrollCollapse = TRUE))

    # upしたcsvからstdをplot
    stdPlot <- reactive({
      # 数値型以外が含まれるか検証
      validate(
        need(validate_numeric(data = csv_file()), paste0(not_numeric_colname(data = csv_file()), "列が数値型でないためプロットできません．"))
      )
      std_plot(data = csv_file())
      })
    output$stdPlot = renderPlot(stdPlot())

    # OKボタンを押したら動く
    observeEvent(input$hplc_submit, {

      stdConc = input$stdConc
      dil         = input$dil
      extVol = input$extVol

      # result_csvに計算後のcsvを代入
      result_csv = reactive(cal_hplc(data = csv_file(), std_conc = stdConc, Dil = dil, Ext_vol = extVol))
      # resultタブに結果を表示
      output$hplc_result = DT::renderDataTable(result_csv(), options = list(pageLength = 100, scrollX = TRUE, scrollY = TRUE, scrollCollapse = TRUE))
      
      output$hplc_downloadData = downloadHandler(
      filename = reactive(paste0("Result_", input$hplc_rawdata$name)),
      content = function(file) {
          
          write.csv(result_csv(), file, quote=FALSE, row.names=FALSE)
      })
    })
  })

}