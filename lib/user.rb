class User < ActiveRecord::Base
    has_many :solutions
    has_many :healths, through: :solutions
end 