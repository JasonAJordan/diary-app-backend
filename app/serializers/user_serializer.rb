class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :name, :bio

  has_many :stickers
  has_many :posts, through: :days
  has_many :day_stickers, through: :days

  attributes :days

  #has_many :days, include_nested_associations: true
  # accepts_nested_attributes_for :days

  def days
    customized_days = []
    object.days.collect do |day|
      custom_day = {}
      # custom_day = day.attributes
      custom_day[:id] = day.id
      custom_day[:date] = day.date
      custom_day[:posts] = day.posts
      custom_day[:stickers] = day.stickers

      customized_days.push(custom_day)
    end
    return customized_days
  end

end



