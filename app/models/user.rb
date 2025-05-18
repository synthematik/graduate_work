class User < ApplicationRecord
  attr_accessor :old_password, :remember_token

  has_secure_password(validations: false)

  has_many :notifications, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_one :employee, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :events

  enum :role, {basic: 0, moderator: 1, admin: 2}, suffix: :role

  validates :email, presence: true, uniqueness: true, "valid_email_2/email": true
  validates :password, confirmation: true, allow_blank: true, length: {minimum: 6, maximum: 30}
  validate :password_presence
  validate :correct_old_password, on: :update, if: -> { password.present? }

  validate :prevent_admin_demotion, on: :update

  def remember_me
    self.remember_token = SecureRandom.urlsafe_base64

    update_column :remember_me_token_digest, digest(remember_token)
  end

  def forget_me
    update_column :remember_me_token_digest, nil
    self.remember_token = nil
  end

  def remember_token_authenticated?(remember_token)
    return false unless remember_me_token_digest.present?

    BCrypt::Password.new(remember_me_token_digest).is_password?(remember_token)
  end

  def employee?
    employee.present?
  end

  private

  def prevent_admin_demotion
    return unless role_changed?
    return unless role_was == "admin"
    return unless self == current_user # Или ваша логика определения текущего пользователя

    errors.add(:role, "Вы не можете понизить свои права администратора")
  end

  def digest(token)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    BCrypt::Password.create(token, cost: cost)
  end

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add :old_password, "Error man"
  end

  def password_presence
    errors.add(:password, :blank) unless password_digest.present?
  end
end
