# frozen_string_literal: true

class UserConversation < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  belongs_to :stage, optional: true
end
