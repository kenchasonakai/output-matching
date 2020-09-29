class MatchingPost < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :time_frames, dependent: :destroy
end
