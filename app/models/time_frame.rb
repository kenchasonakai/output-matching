class TimeFrame < ApplicationRecord
	belongs_to :user
	belongs_to :matching_post
end
