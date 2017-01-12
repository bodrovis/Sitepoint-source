# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  category = Category.create({
                                 title: Faker::Book.title
                             })

  5.times do
    category.posts.create({
                              title: Faker::Book.title,
                              body: Faker::Lorem.sentence
                          })
  end
end