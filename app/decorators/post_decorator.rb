class PostDecorator < ApplicationDecorator
  delegate_all
  include Roles::Reactionable
  include Roles::Uploadable
end
