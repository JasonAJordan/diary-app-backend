class Sticker < ApplicationRecord
  belongs_to :user
  has_many :day_stickers
end
