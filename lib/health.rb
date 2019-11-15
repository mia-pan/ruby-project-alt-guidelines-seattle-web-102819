class Health < ActiveRecord::Base
    has_many :users, through: :solutions
    has_many :solutions
end