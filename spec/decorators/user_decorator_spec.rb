# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserDecorator do
  let(:user) { create(:user) }
  let(:decorated) { described_class.decorate(user) }

  describe '#full_name' do
    subject { decorated.full_name }

    context 'when first & last name' do
      it { is_expected.to eq "#{user.first_name} #{user.last_name}" }
    end
  end

  describe '#most_recent_profile photo' do
    subject { decorated.most_recent_profile_photo }

    context 'when no uploads' do
      it { is_expected.to eq 'https://cdn1.iconfinder.com/data/icons/business-charts/512/customer-512.png' }
    end
  end
end
