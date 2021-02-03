class StickerSerializer < ActiveModel::Serializer
  attributes :id, :image, :name 
  has_one :user
  has_many :day_stickers

end
