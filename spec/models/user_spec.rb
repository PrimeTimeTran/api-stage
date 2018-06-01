# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should have_many(:conversations).through(:user_conversations) }
  it { should have_many(:stage_conversations).through(:user_conversations) }
  it { should have_many(:private_conversations).through(:user_conversations) }

  has_many = %i[
    stage_conversations
    private_conversations
    user_conversations
    messages
    uploads
    friendships
    friends
    profile_photos
    posts
    reactions
    comments
  ]
  has_many.each { |model| it { should have_many(model) } }
end
