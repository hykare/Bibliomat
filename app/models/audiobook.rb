class Audiobook < ApplicationRecord
  has_many :items, as: :rentable
end
