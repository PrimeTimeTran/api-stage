class ConversationDecorator < ApplicationDecorator
  delegate_all

  def last_message_from_user(current_user_id)
    user = find_last_message_user(current_user_id).decorate
    user_hash(user)
  end

  def last_message_content(current_user_id)
    message = object.messages.last
    if message
      body = add_to_body_if_mine(message, current_user_id)
      message_hash(body || message.body, message)
    else
      message_hash(call_to_action.sample, object)
    end
  end

  def last_three_uploads
    if object.uploads.present?
      object.uploads.last(3).map { |u| transform_upload(u.decorate) }
    else
      []
    end
  end

  def transform_upload(upload)
    user = upload.user.decorate
    {
      id: upload.id,
      url: upload.url,
      media_type: upload.media_type,
      user_name: user.full_name,
      user_avatar_url: user.most_recent_profile_photo
    }
  end

  private
    def find_last_message_user(current_user_id)
      user = object.messages.select { |message| message.user_id != current_user_id }
                              &.last
                              &.user
      return user if user

      new_conversation(current_user_id)
    end

    def new_conversation(current_user_id)
      User.find(object.user_conversations.where("user_id != ?", current_user_id).first.user_id)
    end

    def user_hash(user)
      {
        name: user.full_name,
        avatar_url: url_for(user.most_recent_profile_photo)
      }
    end

    def add_to_body_if_mine(message, current_user_id)
      if message.body.present?
        "You: " + message.body if current_user_id == message.user_id
      else
        if current_user_id == message.user_id
          "You: uploaded a photo"
        else
          "#{message.user.full_name} uploaded a photo"
        end
      end
    end

    def message_hash(body, message)
      {
        body: body,
        sent_at: time(message.created_at)
      }
    end

    def call_to_action
      [
        '#Stage',
        'It started when I got on Stage...',
        'I got on Stage and then...',
        'I wonder how they feel about the music',
        'A cat got your tongue?',
        'In some places silence is considered rude...',
        'Which photo is your favorite?',
        "Don't leave it blank...",
        "They won't know if you don't say",
        "Crickets...",
        "Have some manners... say something!",
        'What are you waiting for?',
        "Staring at this screen won't start a conversation",
        'Great question! Ask to get the answer',
        "Someone should create an app to meet people... oh wait...",
        "Some things are better left unsaid, but most things aren't",
        'If only there were a way to start a conversation... oh wait...',
        "If you're driving right now, living dangerously is a part of life...",
        "Time's ticking",
        "You aren't getting any younger!"
      ]
    end
end
