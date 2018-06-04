class StageDecorator < ApplicationDecorator
  delegate_all

  def active_users
    object.conversations.first.user_conversations.count
  end
end
