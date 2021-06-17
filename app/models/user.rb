class User < ActiveRecord::Base
    has_secure_password
    has_many :boards
    has_many :posts, through: :boards
    validates :username, uniqueness: true
end
