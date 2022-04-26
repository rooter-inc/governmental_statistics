# governmental_statistics

## データの概要
* [市区町村マスタ](#市区町村マスタ)
* [政令指定都市を区毎に分割した市区町村マスタ](#政令指定都市を区毎に分割した市区町村マスタ)
* [日本地図ポリゴン](#日本地図ポリゴン)
---

## 市区町村マスタ
[/data/municipal_master.csv](/data/municipal_master.csv)

総務省が公開している[全国地方公共団体コード](https://www.soumu.go.jp/denshijiti/code.html)のうち市区町村コードをCSV形式でまとめたものです。
令和元年5月1日現在のデータを用いています。

こちらのファイルでは、**政令指定都市を分割せずに**一つのコードで取り扱っています。

ヘッダは以下のようになっています。

| municipal_code | prefecture_kanji | city_kanji | prefecture_kana | city_kana | prefecture_roman | city_roman |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 地方公共団体コード | 都道府県名（漢字） | 市区町村名（漢字） | 都道府県名（全角カナ） | 市区町村名（全角カナ） | 都道府県名（ローマ字）| 市区町村名（ローマ字）|

地方公共団体コードは6桁の数字です。
1桁目と2桁目は[JIS X 0401](https://www.jisc.go.jp/app/jis/general/GnrJISNumberNameSearchList?show&jisStdNo=X0401)で定められた2桁の都道府県コードが入ります。
3\~5桁目には[JIS X 0402](https://www.jisc.go.jp/app/jis/general/GnrJISNumberNameSearchList?show&jisStdNo=X0402)で定められた3桁の市区町村コードが入ります。
6桁目には検査数字（チェックディジット）が入ります。1\~5桁目のうち<img src="https://latex.codecogs.com/svg.image?i" alt="i">桁目の数字を<img src="https://latex.codecogs.com/svg.image?x_i" alt="x_i">とすると、<img src="https://latex.codecogs.com/svg.image?11&space;-&space;\left\{(6&space;x_1&space;&plus;&space;5&space;x_2&space;&plus;&space;4&space;x_3&space;&plus;&space;3&space;x_4&space;&plus;&space;2&space;x_5)&space;\mod&space;11&space;\right\}" alt="11 - \left\{(6 x_1 + 5 x_2 + 4 x_3 + 3 x_4 + 2 x_5) \mod 11 \right\}">の下一桁が検査数字です。

## 政令指定都市を区毎に分割した市区町村マスタ
[/data/municipal_master_with_wards.csv](/data/municipal_master_with_wards.csv)

総務省が公開している[全国地方公共団体コード](https://www.soumu.go.jp/denshijiti/code.html)のうち市区町村コードをCSV形式でまとめたものです。
令和元年5月1日現在のデータを用いています。

こちらのファイルでは、**政令指定都市を分割し、それらに属する区毎に**一つのコードで取り扱っています。

ヘッダは[政令指定都市を分割していない市区町村マスタ](#市区町村マスタ)のものと同じです。

## 日本地図ポリゴン
[/data/japan_map.geojson](/data/japan_map.geojson)

[GeoJSON](https://geojson.org)形式で描かれた日本地図ポリゴンです。
離島などは省略しています。

FeatureCollectionのfeaturesの中には各都道府県のポリゴンが記載されています。
それらに対応するidはJIS X 0401からとっており、nameは都道府県名のローマ字表記となっています。

この地図に人口毎に色付けをすると、下の画像のようになります。
これは[このファイル](https://github.com/rooter-inc/governmental_statistics/blob/1eccdf149b4d478556fa045876dc30d5920eb619/data/japan_map.geojson)のように、都道府県毎のpolygonにfillプロパティで色付けをしています。
GeoJSONだけではLegendを表示することができないようです。

<img src="/images/population_map.png" alt="都道府県人口階級区分図" width="320px">

また関東地方の東京都への昼間流出人口をこの地図を使って表現すると、下の画像のようになります。
これは[このファイル](https://github.com/rooter-inc/governmental_statistics/blob/7143f7d2e5d1dd98477caa25d7333a656c69ff71/data/japan_map.geojson)のように、MultiLineStringを用いて矢印を表現しています。
またそのプロパティにtitleとdescriptionを付けることで、矢印をクリックした際に詳細な流出人口が見られるようになっています。

<img src="/images/tokyo_inflow.png" alt="関東地方各県の東京都への昼間流出人口" width="320px">

株式会社ルーターの所在地をこの地図で表現すると、下の画像のようになります。
これは[このファイル](https://github.com/rooter-inc/governmental_statistics/blob/d70e00513f9030cdf5f581eede9ce3ba8af04282/data/japan_map.geojson)のように、Pointを用いて表現されています。
また下の画像ではピンをクリックして、プロパティを閲覧している状態となっています。

<img src="/images/rooter_address.png" alt="株式会社ルーターの所在地" width="320px">
