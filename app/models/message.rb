# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation, touch: true

  validates :body, presence: true, unless: -> (m) {
    m.upload.present?
  }

  has_one :upload, as: :uploadable

  accepts_nested_attributes_for :upload

  after_create do
    data = MessageSerializer.new(self).to_json
    ActionCable.server.broadcast('ChatChannel', data)
  end
end
