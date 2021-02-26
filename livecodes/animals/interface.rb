require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'

# Simba, Nala, Timon & Pumbaa

simba = Lion.new("Simba")
nala = Lion.new("Nala")
timon = Meerkat.new("Timon")
pumbaa = Warthog.new("Pumbaa")

[simba, nala, timon, pumbaa].each do |animal|
  puts animal.talk
end

