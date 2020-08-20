class Slot < ApplicationRecord
  belongs_to :terminal
  has_many :stores, dependent: :destroy
end
