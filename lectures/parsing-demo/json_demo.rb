require 'json'

# TODO: - let's read/write data from beers.json
filepath = 'data/beers.json'

serialized_beers = File.read(filepath)

json = JSON.parse(serialized_beers)

beers = json["beers"]

p beers[1]["origin"]