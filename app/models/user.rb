class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true,
                       length: { minimum: 5, maximum: 20 },
                       uniqueness: { case_sensitive: true }
  validates :password, presence: true,
                       length: { minimum: 8, maximum: 20 }
end
