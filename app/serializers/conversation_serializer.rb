class ConversationSerializer < ApplicationSerializer
  attributes :id,
             :last_message_content,
             :other_users,
             :last_message_from_user,
             :name,
             :is_stage,
             :uploads

  def last_message_content
    decorated.last_message_content(current_user.id)
  end

  def last_message_from_user
    decorated.last_message_from_user(current_user.id)
  end

  def other_users
    object.users.select {|user| user.id != current_user.id }
  end

  def is_stage
    object.stage_id.present?
  end

  def uploads
    decorated.last_three_uploads
  end
end
