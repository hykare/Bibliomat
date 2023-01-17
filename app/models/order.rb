class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  scope :returned, -> { where.not(return_date: nil) }
  scope :in_progress, -> { where(return_date: nil) }
end

# t.datetime :order_date
# t.datetime :delivery_date
# t.datetime :pickup_date
# t.datetime :return_date
