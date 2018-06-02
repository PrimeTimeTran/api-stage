class ConversationSerializer < ApplicationSerializer
  attributes :id,
             :last_message,
             :other_users,
             :last_message_from_user,
             :name

  def last_message
    message = object.messages.last
    {
      body: message.body,
      sent_at: time(message.created_at)
    }

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

  def time(a)
    return a.strftime('%I:%M %p') if a > 1.day.ago
    return a.strftime('%a') if a > 7.days.ago
    a.strftime('%m-%d')
  end
end
