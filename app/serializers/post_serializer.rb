class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :context, :text_color
  belongs_to :day
end
