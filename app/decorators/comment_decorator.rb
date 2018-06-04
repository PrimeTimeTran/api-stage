class CommentDecorator < ApplicationDecorator
  include Roles::Reactionable
  include Roles::Uploadable

  delegate_all
end
