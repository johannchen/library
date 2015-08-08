class CreateJoinTableUserBook < ActiveRecord::Migration
  def change
    create_join_table :users, :books, table_name: :mybooks do |t|
      # t.index [:user_id, :book_id]
      # t.index [:book_id, :user_id]
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.string :condition
      t.float :price
      t.boolean :share, default: true
      t.datetime :sold_at
      t.string :status
      t.timestamps null: false
    end
  end
end
