class Film < ApplicationRecord
  has_many :items, as: :rentable
end
