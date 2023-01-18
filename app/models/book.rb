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

  def available_items
    unavailable_items = Item.joins(:orders).where('orders.return_date is null')
    Book.items - unavailable_items
  end
end
