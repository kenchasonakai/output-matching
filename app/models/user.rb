class User < ApplicationRecord
  authenticates_with_sorcery!
	has_many :articles, dependent: :destroy
	has_many :time_frames, dependent: :destroy
	has_many :matching_posts, dependent: :destroy
	has_many :relationships, dependent: :destroy
	has_many :matching_users, through: :relationships, source: :followed_user
	has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_user_id', dependent: :destroy
	has_many :matched_users, through: :passive_relationships, source: :user
	validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true
end
