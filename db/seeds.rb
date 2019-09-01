# frozen_string_literal: true

users = [
  { name: 'Ivan1 Petkov',  email: 'john1@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan2 Petkov',  email: 'john2@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan3 Petkov',  email: 'john3@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan4 Petkov',  email: 'john4@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan5 Petkov',  email: 'john5@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan6 Petkov',  email: 'john6@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan7 Petkov',  email: 'john7@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan8 Petkov',  email: 'john8@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan9 Petkov',  email: 'john9@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan0 Petkov',  email: 'john10@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan11 Petkov', email: 'john11@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan12 Petkov', email: 'john12@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan13 Petkov', email: 'john13@gmail.com', password: 'password', password_confirmation: 'password' },
  { name: 'Ivan14 Petkov', email: 'john14@gmail.com', password: 'password', password_confirmation: 'password' }
]

users.each do |user_params|
  u = User.find_or_create_by(user_params)
  u.confirmed_at = Time.now
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