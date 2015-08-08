class AddIdToMybooks < ActiveRecord::Migration
  def change
    add_column :mybooks, :id, :primary_key
  end
end
