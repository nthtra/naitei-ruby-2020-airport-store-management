class Role < ApplicationRecord
  has_many :employees, dependent: nullify
end
