class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :genre, foreign_key: true, null: false  # ジャンルIDへの外部キー
      t.string :title, null: false                         # ゲームタイトルは必須

      t.timestamps
    end
  end
end