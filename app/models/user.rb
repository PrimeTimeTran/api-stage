class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_conversations, dependent: :destroy
  has_many :conversations, through: :user_conversations

  has_many :stage_conversations, -> { where("conversations.stage_id IS NOT NULL") }, through: :user_conversations, source: :conversation
  has_many :private_conversations, -> { where("conversations.stage_id IS NULL") }, through: :user_conversations, source: :conversation
end