class User < ApplicationRecord
  authenticates_with_sorcery!
	has_many :articles, dependent: :destroy
	has_many :time_frames, dependent: :destroy
	has_many :matching_posts, dependent: :destroy
	has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
	has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower
	validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true
end
