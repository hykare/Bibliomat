class Book < ApplicationRecord
  has_many :items, as: :rentable
end
