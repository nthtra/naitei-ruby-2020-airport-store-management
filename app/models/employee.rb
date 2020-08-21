class Employee < ApplicationRecord
  belongs_to :role
  has_many :terminals, dependent: :destroy
  belongs_to :unit

  validates :name, presence: true,
    length: {maximum: Settings.validations.employee.name_maximum}

  validates :email, presence: true,
    uniqueness: true

  validates :password, presence: true,
    length: {minimum: Settings.validations.employee.password_minimum}

  has_secure_password

  def is_store_employee?
    unit_id == Settings.validations.employee.store_unit
  end
end
