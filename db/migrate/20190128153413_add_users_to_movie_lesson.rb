class AddUsersToMovieLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_lessons, :users, :string
  end
end
