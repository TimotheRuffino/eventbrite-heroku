# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = [ "Saint-Rapahël", "Paris", "Marseille", "Lyon", "La Vallette", "Rome", "Deauville"]

User.destroy_all
Event.destroy_all
Attendance.destroy_all

#users = []
#events = []

10.times do |i|
    user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        description: Faker::Lorem.paragraphs,
        password: "testos"
        
    )
    
end

10.times do |i|
    event = Event.create!(
        start_date: Time.parse("2020-08-12"),
        duration: 5 * rand(1..100),
        title: Faker::TvShows::Simpsons.location,
        description: Faker::Lorem.paragraphs,
        price: rand(1..999),
        location: cities.sample,
        admin: User.find(rand(User.first.id..User.last.id))
    )
    
end

10.times do |i|
    attendance = Attendance.create!(
        user: User.find(rand(User.first.id..User.last.id)),
        event: Event.find(rand(Event.first.id..Event.last.id))
    )

end