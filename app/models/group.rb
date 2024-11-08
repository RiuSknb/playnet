class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  # owner_idはユーザーIDを参照するため、作成者ユーザーと関連付けます。
  
  belongs_to :genre, optional: true
  belongs_to :game, optional: true

  has_many :group_members
  has_many :members, through: :group_members, source: :user

  validates :name, presence: true, uniqueness: true
  validates :body, length: { maximum: 500 }

  # 公開か非公開かの確認メソッド（任意）
  def public?
    is_public
  end
end