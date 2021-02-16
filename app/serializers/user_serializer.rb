class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :bio

  has_many :stickers
  #has_many :posts, through: :days
  has_many :day_stickers, through: :days
  has_many :notes

  # has_one_attached :picture

  #has_many :days 
  attributes :days, :posts

  def days
    customized_days = []

    object.days.collect do |day| #map and collect are the same 
      custom_day = {}
      # custom_day = day.attributes #This will include created/updated at for days 
      custom_day[:id] = day.id
      custom_day[:date] = day.date
      
      # custom_day[:posts] = day.posts # this will everything that posts has
      custom_day[:posts] = day.posts.map do |post|  
        {id: post.id, title: post.title, context: post.context, text_color: post.text_color, image: post.image}
      end 

      custom_day[:stickers] = day.stickers.map do |sticker| 
       {id: sticker.id, image: sticker.image, name: sticker.name}
      end 

      custom_day[:day_stickers] = day.day_stickers
      
      customized_days.push(custom_day)
    end
    return customized_days
  end

  def posts 
    customized_posts = []
      object.posts.collect do |post| 
        custom_post = {}
        custom_post[:id] = post.id 
        custom_post[:title] = post.title
        custom_post[:context] = post.context
        custom_post[:text_color] = post.text_color
        custom_post[:image] = post.image
        custom_post[:day_id] = post.day.id
        custom_post[:date] = post.day.date

        customized_posts.push(custom_post)
      end 
      return customized_posts
  end 

end

      # "id": 1,
      # "title": "First Test",
      # "context": "This is a good test",
      # "text_color": "#ff1414"

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

