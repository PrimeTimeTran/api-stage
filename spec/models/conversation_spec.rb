# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it { should have_many(:user_conversations) }
end
