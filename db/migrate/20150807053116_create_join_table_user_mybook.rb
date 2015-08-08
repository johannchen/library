class CreateJoinTableUserMybook < ActiveRecord::Migration
  def change
    create_join_table :users, :mybooks, table_name: :operations do |t|
      # t.index [:user_id, :mybook_id]
      # t.index [:mybook_id, :user_id]
      t.belongs_to :user, index: true
      t.belongs_to :mybook, index: true
      t.datetime :borrowed_at
      t.datetime :returned_at


    end
  end
end
