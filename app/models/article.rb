class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many_attached :photos

  validates :title, presence: true, length: {minimum: 5}
  validate :content_must_have_text

  private

  def content_must_have_text
    if content.body.to_plain_text.strip.length < 5
      errors.add(:content, "должен содержать хотя бы 5 символов текста")
    end
  end
end
