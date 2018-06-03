class ConversationSerializer < ApplicationSerializer
  attributes :id,
             :last_message,
             :other_users,
             :last_message_from_user,
             :name

  def last_message
    message = object.messages.last
    if scope.id == message.user_id
      body = "You: " + message.body
    end
    {
      body: (body || message.body),
      sent_at: time(message.updated_at)
    }

  end

  def last_message_from_user
    user = object.messages.select {|message| message.user_id != current_user.id}.last.user.decorate
    # user = object.messages.last.user.decorate
    {
      name: user.full_name,
      avatar_url: url_for(user.most_recent_profile_photo)
    }
  end

  def other_users
    object.users.select {|user| user.id != current_user.id }
  end
end
