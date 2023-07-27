require 'swagger_helper'

RSpec.describe 'laptops', type: :request do
  path '/api/v1/laptops' do
    get('list laptops') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/laptops' do
    post 'Creates a laptops' do
      tags 'Laptops'
      consumes 'application/json', 'application/xml'
      parameter name: :laptop, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          photo_url: { type: :string },
          model_year: { type: :number },
          price: { type: :number },
          rom_size: { type: :number },
          ram_size: { type: :number }
        },
        required: ['name']
      }

      response '201', 'Users created' do
        let(:laptops) { { name: 'test laptop' } }
        run_test!
      end
    end
  end
end
