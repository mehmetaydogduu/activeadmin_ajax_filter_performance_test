class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :birth_date, :hobbies,:job, :skills, :favourite_quote,
    :avatar, :favourite_books, :favourite_authors, :bio, :created_at, :updated_at
end
