class User < ActiveRecord::Base
    has_many :goals
    has_many :tasks, through: :goals

end