class Audiobook < ApplicationRecord
  has_many :items, as: :rentable

  validates :title, presence: true, length: {maximum: 100}
  validates :author, presence: true, length: {maximum: 100}
  validates :narrator, presence: true, length: {maximum: 100}

end