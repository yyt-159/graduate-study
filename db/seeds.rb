# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |n|
  Team.create!(
  )
end
User.create!(username: "admin",
            email: "yayatto0815@yahoo.co.jp",
            password: "yyt0811",
            password_confirmation: "yyt0811" ,
            admin: true,
            team_id: 1)