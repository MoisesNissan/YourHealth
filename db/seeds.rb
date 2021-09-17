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

photos_doctor = [
  "https://media.istockphoto.com/photos/doctor-holding-digital-tablet-at-meeting-room-picture-id1189304032?k=20&m=1189304032&s=612x612&w=0&h=ovTNnR0JX2cRZkzMBed9exRO_PamZLlysLDFkXesr4Q=",
  "https://media.istockphoto.com/photos/portrait-of-mature-male-doctor-wearing-white-coat-standing-in-picture-id1203995945?b=1&k=20&m=1203995945&s=170667a&w=0&h=W5pDpUgxdsBroe9aFgJUzR0Ess8xPUoST1ZjEvVRgEQ=",
  "https://media.istockphoto.com/photos/team-of-doctors-and-nurses-in-hospital-picture-id1307543618?b=1&k=20&m=1307543618&s=170667a&w=0&h=hXpYmNYXnhdD36C-8taPQvdpM9Oj-woEdge8nvPrsZY=",
  "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGRvY3RvcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://media.istockphoto.com/photos/portrait-of-middle-aged-asian-female-doctor-standing-in-hospital-picture-id1271328839?b=1&k=20&m=1271328839&s=170667a&w=0&h=SIMzwoe8eu43OoY4M3ElZCMxW9MgDbZbVzMhh4VY2zM=",
  "https://images.unsplash.com/photo-1622253692010-333f2da6031d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGRvY3RvcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "http://medicare.bold-themes.com/cardiology/wp-content/uploads/sites/10/2018/01/img-team-member-01.jpg",
  "http://medicare.bold-themes.com/cardiology/wp-content/uploads/sites/10/2018/01/img-team-member-02.jpg",
  "http://medicare.bold-themes.com/cardiology/wp-content/uploads/sites/10/2018/01/img-team-member-03.jpg",
  "http://medicare.bold-themes.com/cardiology/wp-content/uploads/sites/10/2018/01/img-team-member-04.jpg",
  "http://medicare.bold-themes.com/clinic/wp-content/uploads/sites/2/2015/12/pic-team-1.jpg",
  "http://demo2.themewarrior.com/hospitalplus/wp-content/uploads/sites/22/2016/04/Dr-Kathirnia.jpg",
  "http://demo2.themewarrior.com/hospitalplus/wp-content/uploads/sites/22/2016/04/Dosctor-Miha.jpg",
  "http://demo2.themewarrior.com/hospitalplus/wp-content/uploads/sites/22/2016/04/xray-doctors-filum-1024x1024.jpg",
  "http://demo2.themewarrior.com/hospitalplus/wp-content/uploads/sites/22/2016/04/pediactirc-Doctors-e1460536658595-400x400.jpg"
]

photos_patient = [
  "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1560250097-0b93528c311a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8dXNlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1614436163996-25cee5f54290?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1601455763557-db1bea8a9a5a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1484863137850-59afcfe05386?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDR8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1604607055958-4def78942d6e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1541178735493-479c1a27ed24?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTV8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1624574337423-7ea725c5540c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1525357816819-392d2380d821?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTl8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1606045555551-423ba7ede64f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTd8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1586297135537-94bc9ba060aa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzR8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"
]

specialties = ["Immunologist", "Anesthesiologist", "Cardiologist", "Dermatologists", "Hematologist", "Infectious Disease Specialist", "Emergency Medicine Specialist"]

pic_index_doctor = 0
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
    image_url: photos_doctor[pic_index_doctor],
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
  pic_index_doctor += 1
end
puts 'Finished!'

pic_index_patient = 0
puts 'Creating 15 fake Patients...'
15.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    gender: Faker::Gender.binary_type,
    age: rand(20..50),
    image_url: photos_patient[pic_index_patient],
  )
  user.save!
  pic_index_patient += 1
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
