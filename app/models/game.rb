class Game < ApplicationRecord
  has_many :items, as: :rentable
end
