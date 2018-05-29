class CommentSerializer < ApplicationSerializer
  attributes :id, :body, :user, :reactions_count, :owner, :uploads

  has_many :reactions
  has_many :uploads

  def owner
    scope.id == object.user_id
  end

  def decorated
    object.decorate
  end

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
end
