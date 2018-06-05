class StageDecorator < ApplicationDecorator
  delegate_all

  def active_users
    object.conversations.first.user_conversations.count
  end

  def conversation_id
    object.conversations.first.id
  end

  def business_address
    "#{object.address}, #{object.city}"
  end
end
