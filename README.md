# Lab App 2

### Labでの作業効率を向上させるアプリケーション
### 目次
- [起動方法](#anchor1)
- [機能紹介](#anchor2)
    - [HPLC計算ツール](#anchor2-1)

<a id="anchor1"></a>

## 起動方法
##### 起動方法1. 以下のURLからアクセス
https://lab-app2.herokuapp.com/

##### 起動方法2. 以下のコマンドをRコンソールで実行して下さい．  
※ shinyパッケージをインストールしてある必要があります．

```R
library(shiny)
runGitHub("Lab_app_2", "tonegawa07")
```

<a id="anchor2"></a>

## 機能紹介

<a id="anchor2-1"></a>

## 1. HPLC計算ツール

#### Consept

#### 煩雑なコピー＆ペーストが不要なため，人為的ミスの防止と迅速な計算が可能です．

### 操作方法

#### 1. 以下の形式のcsvファイルを用意する必要があります．

- 必須条件
  - 1列目が"STD", "UNK"を含むサンプルIDであること  
  - 2列目以降には定量に使用する値が入っていること
  - 最終列が秤量値であること

### カテキン類&カフェインの場合
| ID | C         | EC        | GC        | EGC       | EGCG      | Caf.      | ECG       | CG        | DW           |
|-------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|--------------|
| STD-0001 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| STD-0002 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| STD-0003 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| UNK-0001 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |
| UNK-0002 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |
| UNK-0003 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |

### FAAsの場合
| ID    | Asp             | Glu             | Asn             | Ser             | Gln             | IS              | Arg             | Ala             | Thea            | GABA            | DW           |
|----------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|--------------|
| STD-0001 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| STD-0002 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| STD-0003 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| UNK-0001 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |
| UNK-0002 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |
| UNK-0003 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |

#### 2. "CSVファイルを選択して下さい"の欄から用意したcsvファイルをアップロードします．
"生データ"タブでupしたデータを確認することができます．  
"STD確認用プロット"タブでSTDのばらつきがないかを確認することができます．

#### 3. "STD濃度 (ppm)", "希釈倍率", "抽出時の溶媒量 (mL)"の3つのパラメータを設定し，"計算"ボタンをクリックします．
"計算結果"タブにmg/g換算後のデータが追加されたテーブルが表示されています．

#### 4. "計算結果のダウンロード"ボタンをクリックします．
“計算結果"タブに表示されていたテーブルがダウンロードされます．
