server = function(input, output, session) {

  # cal_hplc
  # csvがupされたら動く
  observeEvent(input$hplc_rawdata, {
    
    # csv_fileにupしたcsvを代入
    csv_file = reactive(read.csv(input$hplc_rawdata$datapath, fileEncoding = "CP932"))
    # rawdataをoutputする
    output$hplc_rawdata = DT::renderDataTable(csv_file(), options = list(pageLength = 100, scrollX = TRUE, scrollY = TRUE, scrollCollapse = TRUE))

    # upしたcsvからstdをplot
    stdPlot <- reactive({
      # 数値型以外が含まれるか検証
      validate(
        need(
          # 数値型以外があればFALSEを返す
          validate_numeric(data = csv_file()), 
          # FALSE時に数値型以外の列名を表示
          paste0("「", not_numeric_colname(data = csv_file()), "」列が数値型でないためプロットを表示できません．"))
        )
      std_plot(data = csv_file())
    })
    
    output$stdPlot = renderPlot(stdPlot())

    # 計算ボタンを押したら動く
    observeEvent(input$hplc_submit, {

      stdConc = input$stdConc
      dil         = input$dil
      extVol = input$extVol

      # result_csvに計算後のcsvを代入
      result_csv <- reactive({
              # 数値型以外が含まれるか検証
      validate(
        need(
          # 数値型以外があればFALSEを返す
          validate_numeric(data = csv_file()), 
          # FALSE時に数値型以外の列名を表示
          paste0("「", not_numeric_colname(data = csv_file()), "」列が数値型でないため計算結果を表示できません．"))
        )
        cal_hplc(data = csv_file(), std_conc = stdConc, Dil = dil, Ext_vol = extVol)
      })

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