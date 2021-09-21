class Genre < ApplicationRecord
    has_many :driving_genre_relations, dependent: :destroy
    has_many :drivings, through: :driving_genre_relations, dependent: :destroy
end
