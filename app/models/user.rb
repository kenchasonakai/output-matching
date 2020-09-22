class User < ApplicationRecord
  authenticates_with_sorcery!
	has_many :offering_posts, dependent: :destroy
	has_many :matchings, dependent: :destroy
	validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true
end
