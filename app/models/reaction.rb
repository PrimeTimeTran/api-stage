# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactionable, polymorphic: true

  enum type: { like: 0, heart: 1, wow: 2, laugh: 3, sad: 4 }
end
