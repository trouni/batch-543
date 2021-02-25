require "open-uri"
require "yaml"

file = "https://gist.githubusercontent.com/juliends/461638c32c56b8ae117a2f2b8839b0d3/raw/adb8195d6ff94fd34b3af265cffd9918772debe2/imdb.yml"
sample = YAML.load(open(file).read)

puts 'Creating directors...'
directors = {}  # slug => Director
sample["directors"].each do |director|
  directors[director["slug"]] = Director.create! director.slice("first_name", "last_name")
end

puts 'Creating movies...'
sample["movies"].each do |movie|
  Movie.create! movie.slice("title", "year", "synopsis").merge(director: directors[movie["director_slug"]])
end

puts 'Creating tv shows...'
sample["series"].each do |tv_show|
  TvShow.create! tv_show
end
puts 'Finished!'