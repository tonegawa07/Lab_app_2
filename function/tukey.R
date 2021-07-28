tukey = function(target, class, level, data){
  
  # 列名を変換
  names(data)[c(1,2,3)] = c("CLASS", "treat", "n")
  
  # 指定した検定対象(target)とclassに基づきデータを抽出
  selected_data =
    data %>%
    gather(4:ncol(data), key = key, value = value) %>%
    filter(key == target, CLASS == class) %>%
    dplyr::select(1:3,value)
  
  # anovaの結果を"anova_result"に格納
  anova_result = aov(value~treat, data = selected_data)
  #print(anova(anova_result))
  
  # 指定した有意水準でのtukeyの結果を"tukey_result"に格納
  tukey_result = cld(glht(anova_result, linfct = mcp(treat= "Tukey")), level = level)
  # アルファベットを取得し，"letters"に格納
  letters = tukey_result$mcletters$Letters
  
  # class, 検定対象(target)の列を持つdataframe"info_df"を用意
  info_df = data.frame(class, target)
  # lettersに格納したアルファベットをdataframeに変換
  letters_df = as.data.frame(t(letters))
  # info_dfとletters_dfを結合しoutput_dfとする
  output_df = cbind(info_df, letters_df)
  
  # output_dfを返す
  return(output_df)
}