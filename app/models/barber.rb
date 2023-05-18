class Barber < ApplicationRecord
  has_many :payments
  has_many :clients, through: :payments
end
