class Terminal < ApplicationRecord
  has_many :slots
  has_one :employee
  validates :name, presence: true,
  length: {maximum: Settings.validations.user.name.max_length}
  
end
