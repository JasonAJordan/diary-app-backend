class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :context, :text_color
  #belongs_to :user

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



