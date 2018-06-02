require 'rails_helper'

RSpec.describe Upload, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:uploadable) }
  it { should have_many(:reactions) }
  it { should have_many(:comments) }
end
