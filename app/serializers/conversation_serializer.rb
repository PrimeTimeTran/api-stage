class ConversationSerializer < ApplicationSerializer
  attributes :id,
             :last_message,
             :other_users,
             :last_message_from_user,
             :name,
             :is_stage

  has_many :uploads

  def last_message
    message = object.messages.last
    if message.body.present?
      body = "You: " + message.body if scope.id == message.user_id
    else
      if scope.id == message.user_id
        body = "You: uploaded a photo"
      else
        body = "#{message.user.full_name} uploaded a photo"
      end
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
    object.users.select {|user| user.id != current_user.id }.tap { |hash| hash.delete(:email) }
  end

  def is_stage
    object.stage_id.present?
  end
end
