class Like < ApplicationRecord
  belongs_to :driving
  belongs_to :user
  validates_uniqueness_of :driving_id, scope: :user_id
end
