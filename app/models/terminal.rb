class Terminal < ApplicationRecord
  has_many :slots, dependent: :nullify
  has_one :employee, dependent: :nullify
  validates :name, presence: true,
  length: {maximum: Settings.validations.user.name.max_length}
end
