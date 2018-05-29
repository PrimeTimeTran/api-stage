class CommentSerializer < ApplicationSerializer
  attributes :id,
             :body,
             :user,
             :reactions_count,
             :owner?,
             :upload

  has_many :reactions

  def user
    user = scope.decorate
    {
      full_name: user.full_name,
      user_profile_photo: user.decorate.most_recent_profile_photo,
    }
  end

  def reactions_count
    decorated.reactions_total_count
  end

  def upload
    decorated.url
  end
end
