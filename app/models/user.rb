# frozen_string_literal: true

class User < ApplicationRecord
  validates :email,  presence: true, format: { with: /\A.+@.+$\Z/ }, uniqueness: true
  validates :first_name, :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :uploads, dependent: :destroy
  has_many :profile_photos, dependent: :destroy

  has_many :user_conversations, dependent: :destroy
  has_many :conversations, through: :user_conversations
  has_many :stages, through: :conversations
  has_many :messages, dependent: :destroy

  has_many :stage_conversations, -> { where('conversations.stage_id IS NOT NULL') }, through: :user_conversations, source: :conversation
  has_many :private_conversations, -> { where('conversations.stage_id IS NULL') }, through: :user_conversations, source: :conversation

  has_many :posts, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
end
