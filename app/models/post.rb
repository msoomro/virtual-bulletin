class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :bulletin_board
    belongs_to :category

end