class Post < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  # アソシエーション設定
  belongs_to :user
  belongs_to :genre, optional: true
  belongs_to :game, optional: true
  belongs_to :group, optional: true
  # optional: true は、この関連が必須でないことを示します。
  # つまり、Post インスタンスは Game に関連付けられなくてもよい、ということです。Game が nil の場合でも Post を保存することができます。

  # バリデーション設定
  validates :title, presence: true, unless: :is_deleted, length: { maximum: 100 }
  validates :body, presence: true, unless: :is_deleted, length: { maximum: 1000 }
  validates :deleted_by, inclusion: { in: %w(user admin), allow_blank: true } # 削除者は 'user' または 'admin' のみ許容
  with_options if: -> { post_type == 'event' } do |post|
    post.validates :place, presence: true
    post.validates :date, presence: true
  end

  # スコープ設定
  scope :active, -> { where(is_deleted: false) } # 論理削除されていない投稿のみを取得
  # scope :deleted, -> { where(is_deleted: true) } # 論理削除された投稿のみを取得

  # メソッド例(削除実行者 (by) と削除理由 (reason) を記録するメソッド)
  def mark_as_deleted(by:, reason: nil)
    update(is_deleted: true, deleted_by: by, deleted_reason: reason)
  end

  enum deleted_by: { user: 0, admin: 1 }
end
