tw_anova <- function(target, class, data){
  
  # 検定対象(target)名を取得
  col = target
  # factor名を取得
  factor_1 = data.frame(factor=colnames(data[2]))
  factor_2 = data.frame(factor=colnames(data[3]))
  int      = data.frame(factor="interaction")
  
  # 列名を変換
  names(data)[c(1,2,3,4)] = c("CLASS", "factor_1", "factor_2", "n")
  
  # 指定した検定対象(target)とclassに基づきデータを抽出
  selected_data =
    data %>%
    gather(5:ncol(data), key = key, value = value) %>%
    filter(key == target, CLASS == class) %>%
    dplyr::select(1:4,value)
  
  # two-way-anovaの結果を"result_df"に格納
  anova_result = aov(value~factor_1*factor_2, data = selected_data)
  result_df = anova(anova_result)
  #print(result_df)
  
  # factor情報の列を持つdataframe"info_df"を用意
  info_df = rbind(factor_1, factor_2, int)
  # p値を取得，各水準に基づいた新たな列を作成しその列のみを持つdataframe"pvalue_df"を用意
  pvalue_df =
    data.frame(p=result_df$`Pr(>F)`) %>%
    na.omit() %>%
    mutate(!!col := case_when(
      p<0.001~"< 0.001",
      p<0.01~"< 0.01",
      p<0.05~"< 0.05",
      p>=0.05~"n.s."
    )) %>%
    dplyr::select(2)
  
  # info_dfとpvalue_dfを結合しoutput_dfとする
  output_df = cbind(info_df, pvalue_df)
  
  # output_dfを返す
  return(output_df)
}