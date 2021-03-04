class User < ActiveRecord::Base
    has_many :posts
    has_many :bulletin_boards
    has_many :categories, through: :posts

end