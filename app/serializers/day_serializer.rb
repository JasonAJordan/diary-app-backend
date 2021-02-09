class DaySerializer < ActiveModel::Serializer
  attributes :id, :date
  
  has_many :posts 
  has_many :day_stickers 
  has_many :stickers, through: :day_stickers
  #has_one :user 

  attributes :user 
   
  def user
    {id: self.object.user.id, 
      username: self.object.user.username,
      password: self.object.user.password,
      name: self.object.user.name,
      bio: self.object.user.bio,
     }
  end 

  # def user 
  #   customized_users = [:user]

  #   customized_user.map do |user| 
  #     custom_user = {}
  #     custom_user[:id] = user.id
  #   end 
  #   re

end
