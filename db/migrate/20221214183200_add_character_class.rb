class AddCharacterClass < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :character_class, :string
  end
end
