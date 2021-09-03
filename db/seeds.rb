# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
User.destroy_all
Doctor.destroy_all

puts "creating users"
user_1 = User.create!(email: "user1@gmail.com", password: "123456", first_name: 'Salo', last_name: 'Nissan', gender: "Male", age: 36)
user_2 = User.create!(email: "user2@gmail.com", password: "123456", first_name: 'David', last_name: 'Maya', gender: "Male", age: 30)
user_3 = User.create!(email: "user3@gmail.com", password: "123456", first_name: 'Pepe', last_name: 'Aske', gender: "Male", age: 46)

puts "creating doctors"
doctor_1 = Doctor.create!(email: "doctor1@gmail.com", password: "123456", first_name: 'Mery', last_name: 'Sitton', gender: "Female", specialty: "Surgeon")
doctor_2 = Doctor.create!(email: "doctor2@gmail.com", password: "123456", first_name: 'Sari', last_name: 'Gonzales', gender: "Female", specialty: "Medic")
doctor_3 = Doctor.create!(email: "doctor3@gmail.com", password: "123456", first_name: 'Eli', last_name: 'Alvarez', gender: "Male", specialty: "Brain Damage")

puts "creating medical records"
MedicalRecord.create!(lab_results: "negative", medications: "tylenol", description: 'alive', user: user_1, doctor: doctor_1)
MedicalRecord.create!(lab_results: "positive", medications: "advil", description: 'almost dead', user: user_2, doctor: doctor_2)
MedicalRecord.create!(lab_results: "half", medications: "peptobismol", description: 'dying', user: user_3, doctor: doctor_3)
