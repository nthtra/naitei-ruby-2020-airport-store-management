class Unit < ApplicationRecord
  has_many :employees, dependent: :destroy
end
