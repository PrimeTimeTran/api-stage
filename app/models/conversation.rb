# frozen_string_literal: true

class Conversation < ApplicationRecord
  belongs_to :stage, optional: true

  has_many :user_conversations, dependent: :destroy
  has_many :users, through: :user_conversations

  has_many :messages
  has_many :uploads, through: :messages, source: :upload

  default_scope { order(updated_at: 'DESC') }

  # TODO: need to search by message as well
  # scope :search, -> (keyword) { where('name LIKE ?', "%#{keyword}%") }

  def self.search(keyword, current_user_id)
    user = User.find(current_user_id)
    users = user.private_conversations
                  .collect { |c| c.user_conversations }.flatten
                  .select { |uc| uc.user_id != current_user_id }
                  .collect { |uc| uc.user }

    matching_conversations = users.select { |u| u.first_name.include?(keyword) || u.last_name.include?(keyword) || u.email.include?(keyword) }
                                    .collect { |u| u.private_conversations }.flatten
                                    .collect { |c| c.user_conversations }.flatten
                                    .select { |uc| uc.user_id == current_user_id }
                                    .collect { |uc| uc.conversation }

    where('name LIKE ?', "%#{keyword}%") + matching_conversations
  end
end
