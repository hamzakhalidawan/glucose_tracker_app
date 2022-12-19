# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(email: "test1@gmail.com", password: '123456', password_confirmation: '123456')
user2 = User.create(email: "test2@gmail.com", password: '123456', password_confirmation: '123456')


Glucose.create(level: 123, reading_date: "2022-12-19", user_id: user1.id)
Glucose.create(level: 124, reading_date: "2022-12-12", user_id: user1.id)
Glucose.create(level: 125, reading_date: "2022-11-19", user_id: user1.id)
Glucose.create(level: 126, reading_date: "2022-11-19", user_id: user1.id)
Glucose.create(level: 127, reading_date: "2022-12-19", user_id: user2.id)
Glucose.create(level: 128, reading_date: "2022-12-19", user_id: user2.id)
Glucose.create(level: 129, reading_date: "2022-11-19", user_id: user2.id)
Glucose.create(level: 130, reading_date: "2022-11-19", user_id: user2.id)
Glucose.create(level: 131, reading_date: "2022-11-12", user_id: user2.id)
