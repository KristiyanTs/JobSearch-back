# frozen_string_literal: true
require 'faker'

users = [
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 2 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 2 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 2 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 2 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 2 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 2 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 2 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 1 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 },
  { name: Faker::Name.name , email: Faker::Internet.email, password: 'pass1234A!', password_confirmation: 'pass1234A!', role: 0 }
]

users.each do |user_params|
  u = User.new(user_params)
  u.skip_confirmation!
  u.save
end

statuses = [
  { title: "TODO", color: "#607D8B", order: 1 },
  { title: "In progress", color: "#FFC107", order: 2 },
  { title: "Done", color: "#4CAF50", order: 3 }
]

categories = [
  { title: "Bug", color: "#fff", icon: "bug", icon_color: "#F44336"},
  { title: "Feature", color: "#fff", icon: "plus", icon_color: "#4CAF50"},
]

nodes = [
  { title: "Project1", ancestry: nil, user_id: 1 },
  { title: "Project2", ancestry: nil, user_id: 2 },
  { title: "Project3", ancestry: nil, user_id: 3 },
  { title: "Node1", ancestry: 1, user_id: 1 },
  { title: "Node1", ancestry: 2, user_id: 2 },
  { title: "Node1", ancestry: 3, user_id: 3 },
  { title: "Task1", ancestry: 1, user_id: 1 },
  { title: "Task1", ancestry: 2, user_id: 2 },
  { title: "Task1", ancestry: 3, user_id: 3 },
]