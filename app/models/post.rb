class Post < ActiveRecord::Base
    belongs_to :board
    belongs_to :user
    validates :title, presence: :true
    validates :board_id, presence: :true
    validates :user_id, presence: :true
end
