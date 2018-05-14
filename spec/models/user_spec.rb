require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should have_many(:posts) }
  it { should have_many(:user_conversations) }
  it { should have_many(:conversations).through(:user_conversations) }
  it { should have_many(:stage_conversations).through(:user_conversations) }
  it { should have_many(:private_conversations).through(:user_conversations) }
end