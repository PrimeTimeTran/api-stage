require 'rails_helper'

RSpec.describe Upload, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:uploadable) }
end
