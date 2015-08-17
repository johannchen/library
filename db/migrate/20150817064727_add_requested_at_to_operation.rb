class AddRequestedAtToOperation < ActiveRecord::Migration
  def change
    add_column :operations, :requested_at, :datetime
  end
end
