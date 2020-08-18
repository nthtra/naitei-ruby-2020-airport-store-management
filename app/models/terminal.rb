class Terminal < ApplicationRecord
  has_many :slots, dependent: :nullify
  belongs_to :employee, dependent: :destroy
  
  validates :name, presence: true,
  length: {maximum: Settings.validations.user.name.max_length}
end
