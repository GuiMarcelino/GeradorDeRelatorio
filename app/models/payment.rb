class Payment < ApplicationRecord
  belongs_to :client
  belongs_to :barber
end
