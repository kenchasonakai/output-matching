class TimeFrame < ApplicationRecord
  belongs_to :user
  belongs_to :matching_post
  validates :time_frame, uniqueness: { scope: [:matching_post_id, :user_id] }
end
