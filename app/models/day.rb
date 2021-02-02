class Day < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :day_stickers
end
