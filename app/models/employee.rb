class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {manager: 1, admin: 2, employee: 3}

  has_many :terminals, dependent: :destroy
  belongs_to :unit

  has_many :passive_notifications, class_name: Notification.name,
    foreign_key: :sender_id,
    dependent: :destroy
  has_many :active_notifications, class_name: Notification.name,
    foreign_key: :receiver_id,
    dependent: :destroy
  has_many :notifications, through: :passive_notifications,
    source: :receiver, source_type: "Employee"
  has_many :sent_notifications, through: :active_notifications,
    source: :sender, source_type: "Employee"

  validates :name, presence: true,
    length: {maximum: Settings.validations.employee.name_maximum}

  scope :employee_manager, ->{where(role: "manager")}
end
