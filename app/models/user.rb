class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true

    has_many :days
    has_many :stickers
    has_many :posts, through: :days 
    has_many :day_stickers, through: :days
    has_many :notes
    
    # accepts_nested_attributes_for :days
    
end
