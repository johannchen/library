class AddGoogleBookToBook < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.rename :author, :authors
      t.rename :summary, :description
      t.string :publisher
      t.date :published_date
      t.string :isbn_10
      t.string :isbn_13
      t.integer :page_count
      t.string :image_link
      t.string :preview_link
      t.string :google_id
    end
  end
end
