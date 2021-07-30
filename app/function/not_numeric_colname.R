not_numeric_colname <- function(data) {
  # 数値型以外の列のみにする
  d <- 
    data %>% 
    dplyr::select(2:(ncol(data)-1)) %>%
    dplyr::select(-where(is.numeric),-where(is.integer),-where(is.double))

  # 数値型以外の列名を返す
  return(colnames(d))
}