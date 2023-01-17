class Book < ApplicationRecord
  has_many :items, as: :rentable

  validates :title, presence: true
  validates :title, length: { in: 2..100 }
  validates :author, presence: true

  validates_each :ISBN do |record, attr, isbn_no|
    number_only_isbn_length = isbn_no&.delete('-')&.length
    record.errors.add(attr, 'must be either 10 or 13 characters long') unless [10, 13].include? number_only_isbn_length
  end

  def self.search(query)
    if query
      Book.where('title like ? or author like ?', "%#{query}%", "%#{query}%")
    else
      []
    end
  end

  def free_item
    # have no orders
    # or
    # only have returned orders

    # items that have orders, items repeat
    items = Item.joins(:orders)

    # items with any orders
    items = Item.joins(:orders).distinct

    items = Item.left_outer_joins(:orders).where(orders: { item: nil })
  end
end
