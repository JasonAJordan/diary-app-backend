class StickerSerializer < ActiveModel::Serializer
  attributes :id, :image, :name 
  #has_one :user
  has_many :day_stickers

  attributes :user 
   
  def user
    {id: self.object.user.id, 
      username: self.object.user.username,
      password: self.object.user.password,
      name: self.object.user.name,
      bio: self.object.user.bio,
     }
  end 

end
