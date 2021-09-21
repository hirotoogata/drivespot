class CreateDrivingGenreRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :driving_genre_relations do |t|
      t.references :driving, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
