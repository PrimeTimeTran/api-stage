# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:invalid_attributes) do
    attributes_for(:user,
      password: 'asdf',
      password_confirmation: 'asdf'
    )
  end
  let(:valid_attributes) do
    attributes_for(:user,
      email: user.email,
      password: user.password,
      password_confirmation: user.password,
      first_name: user.first_name,
      last_name: user.last_name
    )
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/v1/signup', params: { user: valid_attributes }.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(200)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/v1/signup', params: { user: invalid_attributes }.to_json, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns password too short' do
        expect(json['message'])
          .to match('Validation failed: Password is too short (minimum is 6 characters)')
      end
    end
  end
end
