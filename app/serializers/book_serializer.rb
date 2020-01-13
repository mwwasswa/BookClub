class BookSerializer < ActiveModel::Serializer
  attributes :id, :genre, :title, :author, :picture, :text
  has_one :user
end
