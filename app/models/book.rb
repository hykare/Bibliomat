class Book < ApplicationRecord
  has_many :items, as: :rentable

  def self.search(query)
    if query
      Book.where("title like ? or author like ?", "%#{query}%", "%#{query}%")
    else
      return []
    end
  end
end
