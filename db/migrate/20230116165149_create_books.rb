class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.integer :publication_year
      t.string :ISBN
      # t.text :description

      t.timestamps
    end
  end
end
