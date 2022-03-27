# governmental_statistics

## データの概要
* [市区町村マスタ](#市区町村マスタ)
* [政令指定都市を区毎に分割した市区町村マスタ](#政令指定都市を区毎に分割した市区町村マスタ)
---

## 市区町村マスタ
https://github.com/rooter-inc/governmental_statistics/blob/main/data/municipal_master.csv

総務省が公開している[全国地方公共団体コード](https://www.soumu.go.jp/denshijiti/code.html)のうち市区町村コードをCSV形式でまとめたものです。
令和元年5月1日現在のデータを用いています。

こちらのファイルでは、政令指定都市を分割せずに一つのコードで取り扱っています。

ヘッダは以下のようになっています。

| municipal_code | prefecture(kanji) | city(kanji) | prefecture(kana) | city(kana) |
| ---- | ---- | ---- | ---- | ---- |
| 地方公共団体コード | 都道府県名（漢字） | 市区町村名（漢字） | 都道府県名（半角ｶﾅ） | 市区町村名（半角ｶﾅ） |

## 政令指定都市を区毎に分割した市区町村マスタ
https://github.com/rooter-inc/governmental_statistics/blob/main/data/municipal_master_with_wards.csv

総務省が公開している[全国地方公共団体コード](https://www.soumu.go.jp/denshijiti/code.html)のうち市区町村コードをCSV形式でまとめたものです。
令和元年5月1日現在のデータを用いています。

こちらのファイルでは、政令指定都市を分割し、それらに属する区毎に一つのコードで取り扱っています。

ヘッダは[政令指定都市を分割していない市区町村マスタ](#市区町村マスタ)のものと同じです。

## 日本地図ポリゴン
https://github.com/rooter-inc/governmental_statistics/blob/main/data/japan_map.geojson

