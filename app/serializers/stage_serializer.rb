class StageSerializer < ApplicationSerializer
  attributes :id,
             :name,
             :address,
             :district,
             :city,
             :country,
             :phone,
             :active_users
  has_many :uploads

  def active_users
    decorated.active_users
  end
end
