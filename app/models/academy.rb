class Academy < ApplicationRecord
  has_many :payments, as: :recipient, dependent: :nullify
  has_many :payments, as: :payer, dependent: :nullify
end
