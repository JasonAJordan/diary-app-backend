class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :name, :bio

  has_many :stickers 
  has_many :posts, through: :days
  has_many :day_stickers, through: :days


  has_many :days 

end


