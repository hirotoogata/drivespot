class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :drivings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_drivings, through: :likes, source: :driving
  has_many :comments, dependent: :destroy

  def already_liked?(driving)
    self.likes.exists?(driving_id: driving.id)
  end
end
