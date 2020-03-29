class MoviesSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :director, :created_at, :updated_at
end