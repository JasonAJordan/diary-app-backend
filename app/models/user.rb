class User < ApplicationRecord
    has_many :days
    has_many :stickers
end
