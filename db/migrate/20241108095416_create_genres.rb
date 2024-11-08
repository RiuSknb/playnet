class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false, unique: true  # ジャンル名は必須、重複不可

      t.timestamps
    end
  end
end
