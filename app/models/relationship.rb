class Relationship < ApplicationRecord
	enum status: { active: 0, finish: 1 }
	belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
	validates :follower_id, presence: true
  validates :followed_id, presence: true
end
