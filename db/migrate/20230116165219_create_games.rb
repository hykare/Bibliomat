class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :studio
      t.integer :publication_year
      # t.text :description

      t.timestamps
    end
  end
end
