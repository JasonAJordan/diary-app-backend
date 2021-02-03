class DayStickerSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :day 
  belongs_to :sticker
  
end
