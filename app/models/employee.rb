class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  has_many :terminals, dependent: :destroy
  belongs_to :unit

  validates :name, presence: true,
    length: {maximum: Settings.validations.employee.name_maximum}
end
