require 'swagger_helper'

RSpec.describe 'reservation', type: :request do
  path '/api/v1/reservation/' do
    post 'Creates a reservation' do
      tags 'Laptops'
      consumes 'application/json', 'application/xml'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :string },
          laptop_id: { type: :string },
          city: { type: :string },
          date: { type: :string },
          hour: { type: :number }
        },
        required: ['city']
      }

      response '201', 'Reservation created' do
        let(:reservation) { { city: 'test city' } }
        run_test!
      end
    end
  end
end
