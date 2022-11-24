class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.belongs_to :user
      
      t.string :name
      
      t.integer :health
      t.integer :exp

      t.timestamps
    end
  end
end
