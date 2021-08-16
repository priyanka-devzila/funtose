class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false 
      t.date :release_date
      t.integer :movie_length_in_minutes
      t.float :rating
      t.string :overview

      t.timestamps
    end
  end
end
