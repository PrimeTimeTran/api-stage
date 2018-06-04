class MessageSerializer < ApplicationSerializer
  attributes :gifted_chat,
             :conversation_id

  def conversation_id
    object.conversation_id
  end

  def gifted_chat
    user = object.user.decorate
    {
      _id: object.id,
      text: object.body,
      created_at: object.created_at,
      user: {
        _id: user.id,
        name: user.full_name,
        avatar: url_for(user.decorate.most_recent_profile_photo)
      }
    }
  end
end