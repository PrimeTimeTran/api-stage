# frozen_string_literal: true

class PostSerializer < ApplicationSerializer
  attributes :id,
             :created_at,
             :body,
             :owner,
             :reactions_count,
             :comments_count,
             :reactions_like,
             :reactions_heart,
             :reactions_wow,
             :reactions_laugh,
             :reactions_sad

  has_one :user
  has_many :comments
  has_many :reactions
  has_many :uploads

  def owner
    scope.id == object.user_id
  end

  def decorated
    object.decorate
  end

  def reactions_count
    decorated.reactions_total_count
  end

  def comments_count
    decorated.comments_total_count
  end

  def reactions_like
    decorated.likes_count
  end

  def reactions_heart
    decorated.hearts_count
  end

  def reactions_wow
    decorated.wows_count
  end

  def reactions_laugh
    decorated.laughs_count
  end

  def reactions_sad
    decorated.sads_count
  end
end
