require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it { should have_many(:user_conversations) }
  it { should have_many(:messages) }
end
