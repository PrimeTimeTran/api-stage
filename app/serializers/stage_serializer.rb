class StageSerializer < ApplicationSerializer
  attributes :id,
             :name
  has_many :uploads
end
