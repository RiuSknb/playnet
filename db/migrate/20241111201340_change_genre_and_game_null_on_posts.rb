class ChangeGenreAndGameNullOnPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :genre_id, false
    change_column_null :posts, :game_id, false
  end
end