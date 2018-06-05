class StageSerializer < ApplicationSerializer
  attributes :id,
             :name,
             :address,
             :district,
             :city,
             :country,
             :phone,
             :active_users,
             :conversation_id

  has_many :uploads

  def active_users
    decorated.active_users
  end

  def conversation_id
    decorated.conversation_id
  end
end
