require 'roo'
require 'open-uri'
require 'nokogiri'

def excel_object(url)
  sleep 1
  URI.open(url) do |f|
    return Roo::Excelx.new(f)
  end
end

def extract_designated_cities(designated_cities_xlsx)
  designated_cities = {}
  city_name = ''

  [*(designated_cities_xlsx.first_row+1)..designated_cities_xlsx.last_row].each do |i|
    if designated_cities_xlsx.row(i)[2].match(/市$/)
      designated_cities[designated_cities_xlsx.row(i)[2]] = []
      city_name = designated_cities_xlsx.row(i)[2]
    else
      designated_cities[city_name].append(designated_cities_xlsx.row(i))
    end
  end

  designated_cities
end

def main
  URI.open('https://www.soumu.go.jp/denshijiti/code.html') do |f|
    page = Nokogiri::HTML.parse(f.read, nil, f.charset)
    xlsx = excel_object('https://www.soumu.go.jp/' + page.at_css('.contentsBody > .aly_tx > .innerBoxB > ul > li > ul > li:last-of-type > a')[:href])

    # 政令指定都市に属する区についてのデータをハッシュに纏める
    designated_cities = extract_designated_cities(xlsx.sheet(xlsx.sheets[1]))

    # 市区町村コードをcsvに纏める
    csv_text = '団体コード,都道府県名(漢字),市区町村名（漢字）,都道府県名（ｶﾅ）,市区町村名（ｶﾅ）'

    city_list = xlsx.sheet(xlsx.sheets[0])
    [*(city_list.first_row+1)..city_list.last_row].each do |i|
      next if city_list.row(i)[2].nil?
      if designated_cities[city_list.row(i)[2]]
        designated_cities[city_list.row(i)[2]].each do |row|
          csv_text += row.to_csv
        end
      else
        csv_text += city_list.row(i).to_csv
      end
    end

    # ダンプ
    File.open('../data/municipal_master.csv', 'w') do |f|
      f.write(csv_text)
    end
  end
end

if __FILE__ == $0
  main
end
