class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.text :description
      t.string :publisher
      t.date :published_date
      t.string :isbn_10
      t.string :isbn_13
      t.integer :page_count
      t.string :image_link
      t.string :preview_link
      t.string :google_id

      t.timestamps null: false
    end
  end
end
