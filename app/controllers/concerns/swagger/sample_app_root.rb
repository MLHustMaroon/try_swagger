module Swagger::SampleAppRoot
  extend ActiveSupport::Concern
  include Swagger::Blocks
  included do
    swagger_root do
      key :swagger, '2.0'
      info do
        key :description, 'created by hustmaroon'
        key :version, '1.0'
        key :title, 'swagger api'
      end
      # extend Swagger::Parameters
    end
  end
end