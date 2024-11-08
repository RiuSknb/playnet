class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true, null: false       # ユーザーIDへの外部キー（必須）
      t.references :genre, foreign_key: true                   # ジャンルIDへの外部キー（必須）
      t.references :game, foreign_key: true                    # ゲームIDへの外部キー（必須）
      t.references :group, foreign_key: true, null: true       # グループIDへの外部キー（任意）
      t.string :title, null: false                             # イベントタイトル（必須）
      t.text :body, null: false                                # イベントの詳細（必須）
      t.string :place, null: false                             # 開催場所（必須）
      t.datetime :date, null: false                            # 開催日時（必須）
      t.boolean :is_deleted, default: false                    # 削除フラグ
      t.string :deleted_by                                     # 削除実行者
      t.text :deleted_reason                                   # 削除理由

      t.timestamps
    end
  end
end
