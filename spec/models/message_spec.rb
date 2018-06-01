# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:conversation) }
  it { should have_one(:upload) }
end
