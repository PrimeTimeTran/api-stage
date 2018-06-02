require 'rails_helper'

RSpec.describe ProfilePhoto, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should have_many(:reactions) }
end
