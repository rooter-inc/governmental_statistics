# governmental_statistics

## データの概要
* [市区町村マスタ](#市区町村マスタ)
* [政令指定都市を区毎に分割した市区町村マスタ](#政令指定都市を区毎に分割した市区町村マスタ)
---

## 市区町村マスタ
https://github.com/rooter-inc/governmental_statistics/blob/main/data/municipal_master.csv

総務省が公開している[全国地方公共団体コード](https://www.soumu.go.jp/denshijiti/code.html)のうち市区町村コードをCSV形式でまとめたものです。
令和元年5月1日現在のデータを用いています。

こちらのファイルでは、**政令指定都市を分割せずに**一つのコードで取り扱っています。

ヘッダは以下のようになっています。

| municipal_code | prefecture(kanji) | city(kanji) | prefecture(kana) | city(kana) |
| ---- | ---- | ---- | ---- | ---- |
| 地方公共団体コード | 都道府県名（漢字） | 市区町村名（漢字） | 都道府県名（半角ｶﾅ） | 市区町村名（半角ｶﾅ） |

地方公共団体コードは6桁の数字です。
1桁目と2桁目は[JIS X 0401](https://www.jisc.go.jp/app/jis/general/GnrJISNumberNameSearchList?show&jisStdNo=X0401)で定められた2桁の都道府県コードが入ります。
3\~5桁目には[JIS X 0402](https://www.jisc.go.jp/app/jis/general/GnrJISNumberNameSearchList?show&jisStdNo=X0402)で定められた3桁の都道府県コードが入ります。
6桁目には検査数字（チェックディジット）が入ります。1\~5桁目のうち<img src="https://latex.codecogs.com/svg.image?i" alt="i">桁目の数字を<img src="https://latex.codecogs.com/svg.image?x_i" alt="x_i">とすると、<img src="https://latex.codecogs.com/svg.image?11&space;-&space;\left\{(6&space;x_1&space;&plus;&space;5&space;x_2&space;&plus;&space;4&space;x_3&space;&plus;&space;3&space;x_4&space;&plus;&space;2&space;x_5)&space;\mod&space;11&space;\right\}" alt="11 - \left\{(6 x_1 + 5 x_2 + 4 x_3 + 3 x_4 + 2 x_5) \mod 11 \right\}">の下一桁が検査数字です。

## 政令指定都市を区毎に分割した市区町村マスタ
https://github.com/rooter-inc/governmental_statistics/blob/main/data/municipal_master_with_wards.csv

総務省が公開している[全国地方公共団体コード](https://www.soumu.go.jp/denshijiti/code.html)のうち市区町村コードをCSV形式でまとめたものです。
令和元年5月1日現在のデータを用いています。

こちらのファイルでは、**政令指定都市を分割し、それらに属する区毎に**一つのコードで取り扱っています。

ヘッダは[政令指定都市を分割していない市区町村マスタ](#市区町村マスタ)のものと同じです。

## 日本地図ポリゴン
https://github.com/rooter-inc/governmental_statistics/blob/main/data/japan_map.geojson

