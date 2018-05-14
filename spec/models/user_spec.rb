require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email).case_insensitive }

  has_many = [:posts, :messages, :user_conversations]
  has_many.each do |model|
    it { should have_many(model)}
  end

  it { should have_many(:conversations).through(:user_conversations) }
  it { should have_many(:stage_conversations).through(:user_conversations) }
  it { should have_many(:private_conversations).through(:user_conversations) }
end