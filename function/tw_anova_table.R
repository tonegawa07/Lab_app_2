tw_anova_table = function(data){
  
  # 1列目の列名を"CLASS"に変換
  names(data)[1] = "CLASS"
  # class_listを作成
  class_list = unique(data$CLASS)
  
  # factor名を取得
  factor_1 = data.frame(factor=colnames(data[2]))
  factor_2 = data.frame(factor=colnames(data[3]))
  int      = data.frame(factor="interaction")
  
  # outputするtableを用意
  output_table = data.frame()
  
  # classをfor文で回す
  for (class_element in class_list) {
    # class列とfactor列を持つdataframe"table"を用意
    table =
      data.frame(class=rep(class_element,3)) %>%
      cbind(rbind(factor_1, factor_2, int))
    
    # 検定対象をfor文で回す
    for (i in 5:(ncol(data))) {
      # phenoに検定対象を代入
      pheno <- colnames(data[i])
      #print(class_element)
      #print(pheno)
      
      # tableにtwo-way-ANOVAの結果を追加
      table = tryCatch({dplyr::left_join(table, tw_anova(target = pheno, class = class_element, data = data), by="factor")},
                              error=function(e){
                                table
                              })
    }
    
    # output_tableにclassごとの結果を追加
    output_table = bind_rows(output_table, table)
  }
  
  # output_tableを返す
  return(output_table)
}