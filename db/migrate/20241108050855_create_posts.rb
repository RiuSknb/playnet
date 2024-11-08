class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, null: false    # ユーザーIDへの外部キー
      t.references :genre, foreign_key: true, null: true    # ジャンルIDへの外部キー
      t.references :game, foreign_key: true, null: true     # ゲームIDへの外部キー
      t.references :group, foreign_key: true, null: true    # グループIDへの外部キー
      t.string :title, null: false                          # タイトル
      t.text :body, null: false                             # 本文
      t.boolean :is_deleted, default: false                 # 削除フラグ
      t.string :deleted_by                                  # 削除実行者（"user" または "admin"）
      t.text :deleted_reason                                # 削除理由

      t.timestamps
    end
  end
end