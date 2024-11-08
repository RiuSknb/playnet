class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーションを追加
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :status_reason, length: { maximum: 30 }

  # アクティブユーザーかどうかをチェックするメソッド
  def active_for_authentication?
    super && is_active
  end
  # Devise の active_for_authentication? メソッドをオーバーライドして、is_active が true のユーザーだけが認証されるようにしています。

  # アカウントが無効化された場合のメッセージ
  def inactive_message
    is_active ? super : :account_inactive
  end
  # inactive_message メソッドをオーバーライドして、is_active が false の場合に :account_inactive メッセージを表示するようにしています。
end
