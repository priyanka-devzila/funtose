class CreateGenresMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :genres_movies do |t|
      t.belongs_to :movie
      t.belongs_to :genre

      t.timestamps
    end
  end
end
