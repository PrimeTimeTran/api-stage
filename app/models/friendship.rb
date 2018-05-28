# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  enum status: { accepted: 0, pending: 1, requested: 3 }
end
