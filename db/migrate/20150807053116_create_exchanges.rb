class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.integer :requester_id
      t.integer :responder_id
      t.integer :requester_book_id
      t.integer :responder_book_id
      t.datetime :requested_at
      t.datetime :exchanged_at
    end
  end
end
