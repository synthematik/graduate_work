class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 5}
end
