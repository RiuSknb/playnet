class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, null: false            # ユーザーIDへの外部キー（必須）
      t.bigint :likeable_id, null: false                            # ポリモーフィック関連用のID（必須）
      t.string :likeable_type, null: false                          # ポリモーフィック関連用のタイプ（必須）

      t.timestamps
    end

    add_index :likes, [:likeable_type, :likeable_id]                # ポリモーフィック関連のための複合インデックス
    add_index :likes, [:user_id, :likeable_id, :likeable_type], unique: true  # ユーザーが同じ対象に複数のいいねを付けられないようにするユニークインデックス
  end
end
