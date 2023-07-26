require 'swagger_helper'

RSpec.describe 'laptops', type: :request do
  path '/api/v1/signup' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: ['username']
      }

      response '201', 'User created' do
        let(:user) { { username: 'test user' } }
        run_test!
      end
    end
  end

  path '/api/v1/login' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: ['username']
      }

      response '201', 'User created' do
        let(:user) { { username: 'test user' } }
        run_test!
      end
    end
  end
end
