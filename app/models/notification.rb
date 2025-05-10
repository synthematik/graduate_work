class Notification < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: {minimum: 5}
  validates :body, presence: true, uniqueness: true, length: {minimum: 5}

  scope :published, -> { where(published: true) }
end
