module Roles
  module Reactionable
    REACTION_TYPE = { like: 0, heart: 1, wow: 2, laugh: 3, sad: 4 }

    def comments_total_count
      object.comments.count
    end

    def reactions_total_count
      object.reactions.count
    end

    def reactions_type_count(type)
      object.reactions.where('reaction_type = ?', type).count
    end

    def likes_count
      reactions_type_count(REACTION_TYPE[:like])
    end

    def hearts_count
      reactions_type_count(REACTION_TYPE[:heart])
    end

    def wows_count
      reactions_type_count(REACTION_TYPE[:wow])
    end

    def laughs_count
      reactions_type_count(REACTION_TYPE[:laugh])
    end

    def sads_count
      reactions_type_count(REACTION_TYPE[:sad])
    end
  end
end