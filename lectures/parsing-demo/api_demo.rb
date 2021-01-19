require 'json'
require 'open-uri'

url = 'https://api.github.com/users/ssaunier'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

puts "#{user['name']} is in #{user['location']} and has #{user['public_repos']} public repos."