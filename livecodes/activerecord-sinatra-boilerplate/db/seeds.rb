require 'faker'

20.times do
  Restaurant.create!(
    name: Faker::JapaneseMedia::OnePiece.character,
    city: Faker::JapaneseMedia::OnePiece.location
  )
end
