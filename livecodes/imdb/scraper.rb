require 'nokogiri'
require 'open-uri'

def fetch_top_5_urls
  url = "https://www.imdb.com/chart/top"
  html_file = open(url).read

  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.titleColumn a').first(5).map do |element|
    "https://www.imdb.com#{element.attribute('href').value}"
  end
end

def scrape_movie(url)
  html_content = open(url, 'Accept-Language' => 'en').read
  doc = Nokogiri::HTML(html_content)

  cast = doc.search('.credit_summary_item:last-child a').first(3).map { |element| element.text.strip }

  director = doc.search('.credit_summary_item a').first.text

  storyline = doc.search('#titleStoryLine > div > p > span').first.text.strip

  title = doc.search('.title_wrapper h1').text.strip[0..-8]
  
  year = doc.search('#titleYear a').text.strip.to_i

  return {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: year
  }
end