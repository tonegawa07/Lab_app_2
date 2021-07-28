tukey_table = function(data, level){
  
  # 列名を変換
  names(data)[c(1,2,3)] = c("CLASS", "treat", "n")
  # class_listを作成
  class_list = unique(data$CLASS)
  
  # outputするtableを用意
  output_table = data.frame()
  
  # classをfor文で回す
  for (class_element in class_list) {
    
    # 検定対象をfor文で回す
    for (i in 4:(ncol(data))) {
      # phenoに検定対象を代入
      pheno <- colnames(data[i])
      #print(pheno)
      #print(class_element)

      # output_tableにtukeyの結果を追加
      output_table = tryCatch({rbind(output_table,tukey(target = pheno, class = class_element, level = level, data = data))},
                              error=function(e){
                                output_table
                              })
    }
  }
  
  # output_tableを返す
  return(output_table)
}
