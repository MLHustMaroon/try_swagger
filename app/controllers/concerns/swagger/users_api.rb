module Swagger::UsersApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/users/{id}' do
      operation :get do
        key :description, 'find user by id'
        key :operationId, :Find_user_by_id

        parameter name: :id do
          key :in, :path
          key :description, 'User ID'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'User specified by ID'
          schema do
            key :required, [:id, :name]
            property :id do
              key :type, :integer
              key :format, :int64
            end
            property :name do
              key :type, :string
            end
          end
        end

        extend Swagger::ErrorResponses::NotFoundError
      end
    end
  end
end