class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :name, :bio

  has_many :stickers
  has_many :posts, through: :days
  has_many :day_stickers, through: :days
  has_many :notes

  # has_one_attached :picture

  #has_many :days 
  attributes :days

  def days
    customized_days = []

    object.days.collect do |day| #map and collect are the same 
      custom_day = {}
      # custom_day = day.attributes #This will include created/updated at for days 
      custom_day[:id] = day.id
      custom_day[:date] = day.date
      
      # custom_day[:posts] = day.posts # this will everything that posts has
      custom_day[:posts] = day.posts.map do |post|  
        {id: post.id, title: post.title, context: post.context, text_color: post.text_color }
      end 

      custom_day[:stickers] = day.stickers.map do |sticker| 
       {id: sticker.id, image: sticker.image, name: sticker.name}
      end 

      custom_day[:day_stickers] = day.day_stickers
      
      customized_days.push(custom_day)
    end
    return customized_days
  end


end

# "id": 1,
# "title": "First Test",
# "context": "This is a good test",
# "text_color": "#b8fffe",

# "id": 1,
#           "image": "https://via.placeholder.com/50",
#           "name": "PlaceHolder",
  #has_many :days, include_nested_associations: true
  # accepts_nested_attributes_for :days

    # def day_stickers 
  #   custom_day_stickers = []

  #   object.day_stickers.collect do

