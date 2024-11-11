class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.references :group, foreign_key: true
      t.string :title
      t.text :body
      t.string :place
      t.datetime :date
      t.string :post_type
      t.boolean :is_deleted, default: false
      t.integer :deleted_by

      t.timestamps
    end
  end
end
