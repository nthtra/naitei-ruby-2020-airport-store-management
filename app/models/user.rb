class User < ApplicationRecord
  PERMITTED_PARAMS = %i(name email company_name identity_number phone_number
                        password password_confirmation).freeze
  has_many :stores, dependent: :nullify
  validates :name, presence: true,
            length: {maximum: Settings.validations.user.name.max_length}
  validates :email, presence: true,
            length: {maximum: Settings.validations.user.email.max_length},
            format: {with: Settings.validations.user.email.regex},
            uniqueness: {case_sensitive: false}
  validates :password, presence: true,
            length: {minimum: Settings.validations.user.password.min_length}
  validates :company_name, presence: true,
            length: {maximum: Settings.validations.user.company_name.max_length}
  validates :identity_number, presence: true,
            length: {
              minimum: Settings.validations.user.identity_number.min_length,
              maximum: Settings.validations.user.identity_number.max_length
            },
            format: {with: Settings.validations.user.identity_number.regex}
  validates :phone_number, presence: true,
            format: {with: Settings.validations.user.phone_number.regex}

  before_save :downcase_email

  has_secure_password

  private
  def downcase_email
    email.downcase!
  end
end
