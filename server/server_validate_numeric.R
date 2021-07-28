# 数値型以外が含まれるか検証
validate(
  need(
    # 数値型以外があればFALSEを返す
    validate_numeric(data = csv_file()), 
    # FALSE時に数値型以外の列名を表示
    paste0(not_numeric_colname(data = csv_file()), "列が数値型でないためプロットできません．"))
)
