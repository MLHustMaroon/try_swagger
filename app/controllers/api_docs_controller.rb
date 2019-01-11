class ApiDocsController < ApplicationController
  include Swagger::Blocks
  include Swagger::SampleAppRoot

  # swagger_root do
  #   key :swagger, '2.0'
  # end

  SWAGGERED_CLASSES = [
      UsersController,
      User,
      self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end