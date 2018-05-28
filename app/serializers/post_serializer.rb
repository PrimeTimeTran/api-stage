# frozen_string_literal: true

class PostSerializer
  include FastJsonapi::ObjectSerializer
  attribute :id, :body
end
