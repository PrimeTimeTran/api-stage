class MessageSerializer < ApplicationSerializer
  attributes :id, :body, :uploads

  has_many :uploads
end
