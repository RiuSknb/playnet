class ChangeDeletedByToIntegerInPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :deleted_by, :integer, default: 0
  end
end
