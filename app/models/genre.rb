class Genre < ApplicationRecord
  has_many :posts
  has_many :events

  validates :name, presence: true, uniqueness: true
end