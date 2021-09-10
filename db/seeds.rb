require "faker"
require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
User.destroy_all
Doctor.destroy_all

# puts "creating medical records"
# MedicalRecord.create!(lab_results: "negative", medications: "tylenol", description: 'alive', user: user_1, doctor: doctor_1)
# MedicalRecord.create!(lab_results: "positive", medications: "advil", description: 'almost dead', user: user_2, doctor: doctor_2)
# MedicalRecord.create!(lab_results: "half", medications: "peptobismol", description: 'dying', user: user_3, doctor: doctor_3)

link = "https://source.unsplash.com/collection/580685/1600x900"

specialties = ["Immunologist", "Anesthesiologist", "Cardiologist", "Dermatologists", "Hematologist", "Infectious Disease Specialist", "Emergency Medicine Specialist"]

puts 'Creating 15 fake Doctors...'
15.times do
  doctor = Doctor.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    gender: Faker::Gender.binary_type,
    age: rand(20..50),
    specialty: specialties.sample,
    image_url: URI.open(link).base_uri.to_s,
    phone_number: Faker::PhoneNumber.cell_phone,
    description: "Veranda was born and raised in Jakarta,
    Indonesia. He graduated from the University of Singapore,
    where he completed is bachelor’s degree. His admission to the State Bar
    of California took place on the 25th of November, 1985. Weebles wobble but
    they don’t fall down. Weebles are around, don’t fall down! Weeble wobble,
    Weeble wobble, Weeble wobble, Weeble wobble, Weeble wobble, Weeble wobble.
    Don’t fall down!"
  )

  doctor.save!
end
puts 'Finished!'

puts 'Creating 15 fake Patients...'
15.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    gender: Faker::Gender.binary_type,
    age: rand(20..50),
    image_url: URI.open(link).base_uri.to_s
  )
  user.save!
end
puts 'Finished!'


# puts 'Creating 15 fake monkeys...'
# pic_index = 0
# 15.times do
#   monkey = Monkey.new(
#     user: user,
#     name: Faker::FunnyName.name,
#     species: "Simian",
#     age: rand(1..20),
#     weight: rand(5..30),
#     price: rand(150..300),
#     address: Faker::Address.street_address
#   )
#   file = URI.open(photos[pic_index])
#   sleep(5)
#   monkey.photo.attach(io: file, filename: 'monkey.png')
#   monkey.save!
#   pic_index += 1
# end
# puts 'Finished!'
