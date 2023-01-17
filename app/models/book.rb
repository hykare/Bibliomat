class Book < ApplicationRecord
  has_many :items, as: :rentable

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

    items = Item.left_outer_joins(:orders).where(orders: {item: nil})


  end
end
