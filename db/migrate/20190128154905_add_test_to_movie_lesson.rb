class AddTestToMovieLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_lessons, :text, :text
  end
end
