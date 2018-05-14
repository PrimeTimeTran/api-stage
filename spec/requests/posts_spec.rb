require 'rails_helper'

RSpec.describe Post, type: :request do
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 10) }
  let(:post_id) { posts.first.id }
  let(:headers) { valid_headers }

  describe 'GET /posts' do
    # make HTTP get request before each example
    before { get '/api/v1/posts', params: {}, headers: headers }

    it 'returns posts' do
      # Custom helper method in ../support/request_spec_helper.rb
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end