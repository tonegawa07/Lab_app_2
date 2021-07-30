cal_hplc = function(std_conc, Dil, Ext_vol, data){
  # Parameters
  #std_conc : std濃度
  #Dil : 希釈倍率
  #Ext_vol : 抽出時溶媒量(mL)
  
  # パラメータに基づき"f"に代入
  f <- std_conc*Dil*(Ext_vol/1000)
  
  # 列名を変換
  names(data)[c(1,ncol(data))] <- c("ID", "DW")
  
  
  # STDの平均値を算出
  std_mean <-
    data %>%
    dplyr::select(1:(ncol(data)-1)) %>%
    filter(grepl("STD", ID)) %>%
    gather(key = key, value = value, 2:(ncol(data)-1), factor_key = T) %>%
    group_by(key) %>%
    summarise(Mean = mean(value)) %>%
    spread(key = key, value = Mean)
  
  #print(std_mean)
  
  # サンプルの濃度(mg/g DW)を算出
  # IDが"UNK"の行を抽出
  sample <-
    data %>%
    filter(grepl("UNK", ID))
  
  # 分析対象をfor文で回す
  for (i in 2:(ncol(sample)-1)) {
    # 分析対象名を取得し"item"に代入
    item <- colnames(sample[i])
    #print(item)
    # 取得した分析対象名から計算結果を表示する列名を作成
    col <- paste0(item, "(mg/g DW)")
    #print(col)
    # 各分析対象のSTD平均値を取得し"std"に代入
    std <- as.numeric(std_mean[item])
    #print(std)
    
    #print(sample[,i])
    # 分析対象の計算結果を新たな列に追加
    sample <-
      sample %>%
      mutate(!!col := (sample[,i]*f) / (std*DW*0.001))
  }
  
  # 計算後のtableを返す
  return(sample)
}