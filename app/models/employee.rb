class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {manager: 1, admin: 2, employee: 3}

  has_many :terminals, dependent: :destroy
  belongs_to :unit

  validates :name, presence: true,
    length: {maximum: Settings.validations.employee.name_maximum}
end
