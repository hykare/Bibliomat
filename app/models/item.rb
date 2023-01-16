class Item < ApplicationRecord
  belongs_to :rentable, polymorphic: true
end
