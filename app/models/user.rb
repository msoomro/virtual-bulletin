class User < ActiveRecord::Base
    has_secure_password
    has_many :boards
    has_many :posts, through: :boards
    validates :username, uniqueness: true
    validates :password, length: { in: 6..50 }
    validates :username, presence: :true
    validates :password, presence: :true
end
