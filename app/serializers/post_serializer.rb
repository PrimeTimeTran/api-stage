class PostSerializer
  include FastJsonapi::ObjectSerializer
  attribute :id, :body
end
