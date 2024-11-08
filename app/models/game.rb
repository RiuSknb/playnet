class Game < ApplicationRecord
  belongs_to :genre
  has_many :posts
  has_many :events

  validates :title, presence: true, uniqueness: true
end