class CommentDecorator < ApplicationDecorator
  delegate_all
  include Roles::ReactionsCountable
end
