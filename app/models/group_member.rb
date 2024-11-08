class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :user

  # 役割が適切な値かどうかをチェックするバリデーション
  validates :role, presence: true, inclusion: { in: %w[owner admin member] }

  # グループ内での役割を判別するヘルパーメソッド
  def owner?
    role == 'owner'
  end

  def admin?
    role == 'admin'
  end
end