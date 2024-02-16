class AddColumToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :docs, :user_id,:integer
  end
end
