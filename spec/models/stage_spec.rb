# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stage, type: :model do
  it { should validate_presence_of(:name) }

  it { should have_many(:conversations) }
  it { should have_many(:users) }
  it { should have_many(:uploads) }
  it { should have_many(:profile_photos) }
end
