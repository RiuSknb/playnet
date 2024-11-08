class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false           # ユーザーIDへの外部キー（必須）
      t.bigint :commentable_id, null: false                        # ポリモーフィック関連用のID（必須）
      t.string :commentable_type, null: false                      # ポリモーフィック関連用のタイプ（必須）
      t.text :body, null: false                                    # コメント本文（必須）
      t.boolean :is_deleted, default: false                        # 削除フラグ
      t.string :deleted_by                                         # 削除実行者
      t.text :deleted_reason                                       # 削除理由

      t.timestamps
    end

    add_index :comments, [:commentable_type, :commentable_id]      # ポリモーフィック関連のための複合インデックス
  end
end
