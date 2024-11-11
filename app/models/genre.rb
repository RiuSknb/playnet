class Genre < ApplicationRecord
  has_many :posts
  has_many :events
  has_many :games, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end