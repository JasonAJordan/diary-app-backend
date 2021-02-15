class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :context, :text_color, :image
  belongs_to :day
#   belongs_to :user, through: :day
end
