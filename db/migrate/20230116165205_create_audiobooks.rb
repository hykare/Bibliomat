class CreateAudiobooks < ActiveRecord::Migration[7.0]
  def change
    create_table :audiobooks do |t|
      t.string :title
      t.string :author
      t.string :narrator
      t.string :publisher
      t.integer :publication_year
      # t.text :description

      t.timestamps
    end
  end
end
