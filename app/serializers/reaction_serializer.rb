class ReactionSerializer < ApplicationSerializer
  attributes :id,
             :reaction_type,
             :user,
             :owner?

  def user
    user = scope.decorate
    {
      full_name: user.full_name,
      user_profile_photo: user.decorate.most_recent_profile_photo,
    }
  end
end
