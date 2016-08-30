class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :username, length:{minimum: 2}, presence: true

end
