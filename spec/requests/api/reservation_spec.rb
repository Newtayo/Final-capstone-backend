require 'swagger_helper'

RSpec.describe 'reservation', type: :request do

#   path '/api/v1/laptops' do
#     # You'll want to customize the parameter types...
#     # parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
#     # parameter name: 'post_id', in: :path, type: :string, description: 'post_id'

#     get('list comments') do
#       response(200, 'successful') do
#         # let(:user_id) { '123' }
#         # let(:post_id) { '123' }

#         after do |example|
#           example.metadata[:response][:content] = {
#             'application/json' => {
#               example: JSON.parse(response.body, symbolize_names: true)
#             }
#           }
#         end
#         run_test!
#       end
#     end
#   end

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
