class Game < ApplicationRecord
  has_many :items, as: :rentable

  validates :title, presence: true
  validates :studio, presence: true
  validates :publication_year, presence: true, inclusion: { in: 1900..Date.current.year }
end
