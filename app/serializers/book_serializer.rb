class BookSerializer < ActiveModel::Serializer
  attributes :id, :genre, :title, :author
  has_one :user
end
