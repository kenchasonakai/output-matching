class OfferingPost < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	enum status: { ready: 0, active: 1, matching: 2, finish: 3 }
end
