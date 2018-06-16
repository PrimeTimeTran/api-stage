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

  has_many :sent_gifts, foreign_key: 'sender_id', class_name: 'VirtualGift'
  has_many :received_gifts, foreign_key: 'receiver_id', class_name: 'VirtualGift'

  private
  def self.search(search)
    where(['first_name LIKE ? OR last_name LIKE ? OR phone_number LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  end
end
