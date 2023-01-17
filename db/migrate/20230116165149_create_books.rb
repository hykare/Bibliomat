class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.integer :publication_year
      t.string :ISBN
      t.string :image_url_S
      t.string :image_url_M
      t.string :image_url_L
      # t.text :description

      t.timestamps
    end
  end
end
