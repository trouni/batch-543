require 'csv'

# TODO: - let's read/write data from beers.csv
filepath = 'data/beers.csv'

# csv_options = { headers: :first_row }

# beers = []

# CSV.foreach(filepath, csv_options) do |row|
#   beers << row # beers.push(row)
# end

# p beers[2]["Name"]

csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

beers = [
  { name: 'Asahi', appearance: 'Pale Lager', origin: 'Japan' },
  { name: 'Guinness', appearance: 'Stout', origin: 'Ireland' }
]

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ["Name", "Appearance", "Origin"]
  beers.each do |beer|
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
end