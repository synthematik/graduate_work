class Event < ApplicationRecord
  belongs_to :user

  validates :title, :starts_at, presence: true
  validates :title, :description, length: {maximum: 100}

  scope :published, -> {
    where(published: true)
      .where("starts_at >= ?", Time.current.end_of_day)
  }

  def single_day?
    ends_at.blank? || starts_at.to_date == ends_at.to_date
  end

  def formatted_date_range
    if single_day?
      I18n.l(starts_at.to_date, format: :long)
    else
      "#{I18n.l(starts_at.to_date, format: :long)} – #{I18n.l(ends_at.to_date, format: :long)}"
    end
  end

  def formatted_time
    starts_at.strftime("%H:%M")
  end
end
