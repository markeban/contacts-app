User.create(email: "test@test.com", password: "password")
User.create(email: "Ihavefriends@test.com", password: "password")
User.create(email: "Ilovepeople@test.com", password: "password")

100.times do
  Contact.create(first_name: Faker::Name.first_name, middle_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, bio: Faker::Lorem.paragraph(2, true), user_id: rand(1..3))
end
Group.create(name: "Coworkers")
Group.create(name: "Emperor Penguins")
Group.create(name: "Rotary Club")
Contact.all.each do |contact|
  random_number = rand(1..10)
  if random_number > 2 && random_number <= 5
    ContactGroup.create(contact_id: contact.id, group_id: rand(1..3))
  elsif random_number >= 6 && random_number < 9
    random_groups = (1..3).to_a.shuffle.uniq
    ContactGroup.create(contact_id: contact.id, group_id: random_groups[0])
    ContactGroup.create(contact_id: contact.id, group_id: random_groups[1])
  elsif random_number >= 9
    ContactGroup.create(contact_id: contact.id, group_id: 1)
    ContactGroup.create(contact_id: contact.id, group_id: 2)
    ContactGroup.create(contact_id: contact.id, group_id: 3)
  else
    #belongs to no groups
  end
end






# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
