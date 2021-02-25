require_relative 'scraper.rb'
require 'yaml'

puts "Fetching urls of IMDB's top 5 movies..."
movie_urls = fetch_top_5_urls

puts "Scraping info for each movie..."
movies = movie_urls.map { |movie_url| scrape_movie(movie_url) }

puts "Storing movies into 'top_5_movies.yml'"
File.open('top_5_movies.yml', 'wb') do |file|
  file.write(movies.to_yaml)
end