class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.string :title
      t.string :director
      t.integer :publication_year
      t.text :cast
      # t.text :description

      t.timestamps
    end
  end
end
