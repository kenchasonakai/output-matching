class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :followed_user, class_name: 'User'
	belongs_to :matching_post
  validates :user_id, presence: true
  validates :followed_user_id, presence: true, uniqueness: true
end
