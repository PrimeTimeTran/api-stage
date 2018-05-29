class PostDecorator < ApplicationDecorator
  delegate_all

  def reactions_count
    object.reactions.count
  end

  def reactions_type(kind)
    object.reactions.collect(&:reaction_type).inject(0) {|counter, item| counter += item == kind ?  1 : 0}
  end

  def likes_count
    reactions_type('like')
  end

  def hearts_count
    reactions_type('heart')
  end

  def wows_count
    reactions_type('wow')
  end

  def laughs_count
    reactions_type('laugh')
  end

  def sads_count
    reactions_type('sad')
  end
end
