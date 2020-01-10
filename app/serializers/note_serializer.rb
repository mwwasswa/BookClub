class NoteSerializer < ActiveModel::Serializer
  attributes :id, :note, :page_number, :paragraph_number
  has_one :user
  has_one :book
end
