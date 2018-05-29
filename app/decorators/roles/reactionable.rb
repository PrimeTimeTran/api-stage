module Roles
  module Reactionable
    def comments_total_count
      object.comments.count
    end

    def reactions_total_count
      object.reactions.count
    end

    def reactions_type_count(type)
      object.reactions.collect(&:reaction_type).inject(0) {|counter, item| counter += item == type ?  1 : 0}
    end

    def likes_count
      reactions_type_count('like')
    end

    def hearts_count
      reactions_type_count('heart')
    end

    def wows_count
      reactions_type_count('wow')
    end

    def laughs_count
      reactions_type_count('laugh')
    end

    def sads_count
      reactions_type_count('sad')
    end
  end
end