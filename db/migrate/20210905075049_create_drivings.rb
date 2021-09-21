class CreateDrivings < ActiveRecord::Migration[6.1]
  def change
    create_table :drivings do |t|
      t.string :destination

      t.timestamps
    end
  end
end
