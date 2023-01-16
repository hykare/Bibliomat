class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :item
      t.datetime :order_date
      t.datetime :delivery_date
      t.datetime :pickup_date
      t.datetime :return_date

      t.timestamps
    end
  end
end
