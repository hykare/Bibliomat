class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  scope :returned, -> { where.not(return_date: nil) }
  scope :in_progress, -> { where(return_date: nil) }
end
