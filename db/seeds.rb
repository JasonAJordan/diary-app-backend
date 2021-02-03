# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Day.destroy_all
Post.destroy_all
Sticker.destroy_all
DaySticker.destroy_all

imgPlaceHolder = "https://via.placeholder.com/50"

jason = User.create(username: "JasonJordan", password:"1234", name: "Jason Jordan", bio: "This is the bio")

start = Date.new(2020,1,1)
365.times {
    Day.create!(user_id: jason.id, date: start.strftime("%m/%d/%Y"))
    start = start.tomorrow()
}

post1 = Post.create(day_id: 1, title: "First Test", context: "This is a good test", text_color: "red")

sticker1 = Sticker.create(user_id: jason.id, image: imgPlaceHolder, name: "PlaceHolder")


daysticker1 = DaySticker.create(sticker_id: sticker1.id, day_id: 1)



# t.string "username"
# t.string "password"
# t.string "name"
# t.string "bio"