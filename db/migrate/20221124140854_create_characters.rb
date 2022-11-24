class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name

      t.integer :exp
      
      t.integer :strength
      t.integer :dexterity

      t.timestamps
    end
  end
end
