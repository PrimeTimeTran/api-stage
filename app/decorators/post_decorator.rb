class PostDecorator < ApplicationDecorator
  delegate_all
  include Roles::ReactionsCountable
end
