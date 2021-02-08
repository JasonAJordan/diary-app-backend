class Sticker < ApplicationRecord
  belongs_to :user
  has_many :day_stickers

  #has_one_attached :picture

end
