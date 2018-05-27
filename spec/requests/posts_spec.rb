# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :request do
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 10) }
  let(:headers) { valid_headers }
  let(:parameters) do
    {
      body: 'Go',
      user_id: user.id
    }.to_json
  end

  describe 'GET /posts' do
    before { get '/v1/posts', params: {}, headers: headers }

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /posts' do
    before { post '/v1/posts', params: parameters, headers: headers }

    it 'returns a new post' do
      expect(json).not_to be_empty
      expect(json.keys).to include('body')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
