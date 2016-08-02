# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w(apple cherry).each do |item|
  new_item = Item.create({title: item})
  1000.times do
    new_item.click_tracks.create!({created_at: rand(3.years.ago..Time.now) })
  end
end