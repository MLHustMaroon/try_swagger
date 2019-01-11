class User < ApplicationRecord
  include Swagger::UserSchema
  include Swagger::ErrorSchema
end
