class Day < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :day_stickers
  has_many :stickers, through: :day_stickers
end
