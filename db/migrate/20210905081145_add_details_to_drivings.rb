class AddDetailsToDrivings < ActiveRecord::Migration[6.1]
  def change
    add_column :drivings, :image, :string
    add_column :drivings, :body, :text
    add_column :drivings, :address, :string
  end
end
