class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :owner, foreign_key: { to_table: :users }, null: false # 作成者ユーザーID（外部キー）
      t.references :genre, foreign_key: true, null: true                  # ジャンルID（外部キー）
      t.references :game, foreign_key: true, null: true                   # ゲームID（外部キー）
      t.string :name, null: false                                         # グループ名
      t.text :body                                                        # グループ説明
      t.boolean :is_public, default: true                                 # 公開設定
      t.boolean :is_deleted, default: false                               # 削除フラグ
      t.string :deleted_by                                                # 削除実行者（"user" または "admin"）

      t.timestamps
    end
  end
end
