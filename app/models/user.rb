class User < ApplicationRecord
    has_many :days
    has_many :stickers
    has_many :posts, through: :days 
    has_many :day_stickers, through: :days 
    
end
