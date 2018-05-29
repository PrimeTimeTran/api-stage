class ProfilePhoto < ApplicationRecord
  belongs_to :user
  belongs_to :stage, optional: true
end
