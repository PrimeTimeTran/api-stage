class ConversationSerializer < ApplicationSerializer
  attributes :id,
             :last_message,
             :other_users,
             :last_message_from_user,
             :name

  def last_message
    object.messages.last
  end

  def last_message_from_user
    user = object.messages.last.user
    {
      name: user.decorate.full_name,
      avatar_url: url_for(user.decorate.most_recent_profile_photo)
    }
  end

  def other_users
    object.users.select {|user| user.id != current_user.id }
  end
end
