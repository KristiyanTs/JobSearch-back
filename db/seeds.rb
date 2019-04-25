# frozen_string_literal: true

users = [
  { first_name: 'Ivan1', last_name: 'Petar1', email: 'john1@gmail.com' },
  { first_name: 'Ivan2', last_name: 'Petar2', email: 'john2@gmail.com' },
  { first_name: 'Ivan3', last_name: 'Petar3', email: 'john3@gmail.com' },
  { first_name: 'Ivan4', last_name: 'Petar4', email: 'john4@gmail.com' },
  { first_name: 'Ivan5', last_name: 'Petar5', email: 'john5@gmail.com' },
  { first_name: 'Ivan6', last_name: 'Petar6', email: 'john6@gmail.com' },
  { first_name: 'Ivan7', last_name: 'Petar7', email: 'john7@gmail.com' },
  { first_name: 'Ivan8', last_name: 'Petar8', email: 'john8@gmail.com' },
  { first_name: 'Ivan9', last_name: 'Petar9', email: 'john9@gmail.com' },
  { first_name: 'Ivan0', last_name: 'Petar0', email: 'john0@gmail.com' },
  { first_name: 'Ivan11', last_name: 'Petar11', email: 'john11@gmail.com' },
  { first_name: 'Ivan12', last_name: 'Petar12', email: 'john12@gmail.com' },
  { first_name: 'Ivan13', last_name: 'Petar13', email: 'john13@gmail.com' },
  { first_name: 'Ivan14', last_name: 'Petar14', email: 'john14@gmail.com' }
]

password_params = { password: 'password', password_confirmation: 'password' }

users.each do |user_params|
  User.create_with(password_params).find_or_create_by(user_params)
end