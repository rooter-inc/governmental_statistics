require 'open-uri'
require 'nokogiri'

def main
  sleep 1
  URI.open('https://www.stat.go.jp/data/mesh/m_itiran.html') do |htm|
    page = Nokogiri::HTML.parse(htm.read.encode("UTF-8", "CP932"), nil, htm.charset)
    css_links = page.css('#section > article > ul > li > a')
    css_links.each do |css_link|
      sleep 1
      content = URI.open('https://www.stat.go.jp/data/mesh/' + css_link[:href], 'r').read.encode("UTF-8", "CP932")
      filename = css_link.text.gsub(/（CSV：.*$/, '')

      # ダンプ
      File.open("../data/municipal_mesh/#{filename}.csv", 'w') do |f|
        f.write(content)
      end
    end
  end
end

if __FILE__ == $0
  main
end
