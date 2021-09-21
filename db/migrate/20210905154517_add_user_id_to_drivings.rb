class AddUserIdToDrivings < ActiveRecord::Migration[6.1]
  def change
    add_column :drivings, :user_id, :integer
  end
end
