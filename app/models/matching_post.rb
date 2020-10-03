class MatchingPost < ApplicationRecord
	enum status: { active: 0, finish: 1 }
  validates :title, presence: true
  belongs_to :user
  has_many :time_frames, dependent: :destroy
	has_one :matching
end
