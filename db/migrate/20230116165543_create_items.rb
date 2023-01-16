class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :rentable_id
      t.string :rentable_type

      t.timestamps
    end
  end
end
