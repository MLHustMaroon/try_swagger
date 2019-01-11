# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Pets API' do

  path '/users/{id}' do

    get 'Retrieves an user' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
               properties: {
                   id: { type: :integer, },
                   name: { type: :string },
                   email: { type: :string }
               },
               required: [ 'id', 'name', 'email' ]

        let(:id) { User.create(name: 'foo', email: 'email@example.com').id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end