class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name, null: false 
      t.string :title 
      t.date :release_date
      t.float :movie_length
      t.string :language
      t.string :movie_release_country
      t.float :rating
      t.string :overview
      t.string :tagline

      t.timestamps
    end
  end
end