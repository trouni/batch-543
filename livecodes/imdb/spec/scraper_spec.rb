require_relative '../scraper.rb'

describe '#fetch_top_5_urls' do
  it 'should return this array of urls' do
    expected = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    actual = fetch_top_5_urls
    expect(actual).to eq(expected)
  end
end

describe '#scrape_movie' do
  it 'should return a hash with the movie info' do
    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "Set within a year after the events of Batman Begins (2005), Batman, Lieutenant James Gordon, and new District Attorney Harvey Dent successfully begin to round up the criminals that plague Gotham City, until a mysterious and sadistic criminal mastermind known only as \"The Joker\" appears in Gotham, creating a new wave of chaos. Batman's struggle against The Joker becomes deeply personal, forcing him to \"confront everything he believes\" and improve his technology to stop him. A love triangle develops between Bruce Wayne, Dent, and Rachel Dawes.",
      title: "The Dark Knight",
      year: 2008
    }
    actual = scrape_movie("https://www.imdb.com/title/tt0468569")
    expect(actual).to eq(expected)
  end
end