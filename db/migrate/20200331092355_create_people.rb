class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.date :birth_date
      t.string :hobbies, array: true, default: []
      t.string :job
      t.string :skills, array: true, default: []
      t.string :favourite_quote
      t.string :avatar
      t.string :favourite_books, array: true, default: []
      t.string :favourite_authors, array: true, default: []

      t.jsonb :bio

      t.timestamps
    end
  end
end
