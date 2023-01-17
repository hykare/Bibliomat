class Film < ApplicationRecord
  has_many :items, as: :rentable

  validates :title, presence: true, length: {maximum: 100}
  validates :director, presence: true, length: {maximum: 100}

  # t.integer "publication_year"
  # t.text "cast"

end
