class Board < ActiveRecord::Base
    belongs_to :user
    has_many :posts
    validates :title, presence: :true
    validates :user_id, presence: :true
end
