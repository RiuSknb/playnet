class ChangeGenreIdToAllowNullInPosts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :posts, :genre_id, true
    change_column_null :posts, :game_id, true
  end
end
