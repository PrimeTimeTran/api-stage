class StageSerializer < ApplicationSerializer
  attributes :id,
             :name,
             :district,
             :phone,
             :active_users,
             :conversation_id,
             :business_address,
             :is_following

  has_many :uploads

  def active_users
    decorated.active_users
  end

  def conversation_id
    decorated.conversation_id
  end

  def business_address
    decorated.business_address
  end

  def is_following
    scope.stage_conversations.include?(decorated.conversations.first)
  end
end
