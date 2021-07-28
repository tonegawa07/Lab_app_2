validate_numeric <- function(data) {
  # 検証用データ (IDとDW以外の列)
  d <- data %>% 
    dplyr::select(2:(ncol(data)-1))

  # 各列の型を配列に入れる
  d_type <- sapply(d, class)

  # 数値型以外が含まれるか判定し，論理値を配列に入れる
  d_logi <- d_type %in% c("numeric", "integer", "double")

  # 全て数値型ならTRUE，違ったらFALSEを返す
  return(all(d_logi))
}