class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      
      t.belongs_to :character

      t.integer :strength
      t.integer :dexterity
      t.integer :stamina
      t.integer :initiative

      t.integer :added_strength
      t.integer :added_dexterity
      t.integer :added_stamina
      t.integer :added_initiative


      t.timestamps
    end

    
  end
end
