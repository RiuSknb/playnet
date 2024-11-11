class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_members
  has_many :groups, through: :group_members

  
  # バリデーションを追加
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :status_reason, length: { maximum: 30 }

  # is_activeがデフォルトでtrueになるように
  after_initialize :set_default_is_active, if: :new_record?
  
  # アクティブユーザーかどうかをチェックするメソッド
  def active_for_authentication?
    super && is_active
  end

  # アカウントが無効化された場合のメッセージ
  def inactive_message
    is_active ? super : :account_inactive
  end

  private

  def set_default_is_active
    self.is_active ||= true
  end
end