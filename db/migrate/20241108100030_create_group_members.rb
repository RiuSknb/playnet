class CreateGroupMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_members do |t|
      t.references :group, null: false, foreign_key: true  # グループID（外部キー）
      t.references :user, null: false, foreign_key: true   # ユーザーID（外部キー）
      t.string :role, null: false, default: 'member'       # メンバーの役割（デフォルトは'member'）

      t.timestamps
    end

    # 同じユーザーが同じグループに重複して参加しないように、ユニーク制約を追加
    add_index :group_members, [:group_id, :user_id], unique: true
  end
end
