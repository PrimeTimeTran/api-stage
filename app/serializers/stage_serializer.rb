class StageSerializer < ApplicationSerializer
  attributes :id,
             :name,
             :district,
             :phone,
             :active_users,
             :conversation_id,
             :business_address

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
end
