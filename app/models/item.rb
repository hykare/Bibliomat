class Item < ApplicationRecord
  belongs_to :rentable, polymorphic: true
  has_many :orders

  # scope :available, -> {where.not()}
end
