class Driving < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    has_many :driving_genre_relations, dependent: :destroy
    has_many :genres, through: :driving_genre_relations, dependent: :destroy
end
