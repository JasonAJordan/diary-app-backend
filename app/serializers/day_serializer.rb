class DaySerializer < ActiveModel::Serializer
  attributes :id, :date
  
  has_many :posts 
  has_many :day_stickers 
  has_many :stickers, through: :day_stickers
  has_one :user 


end
