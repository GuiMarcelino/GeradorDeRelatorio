class Client < ApplicationRecord
  has_many :payments
  has_many :barbers, through: :payments
end
