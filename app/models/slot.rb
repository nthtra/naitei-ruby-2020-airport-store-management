class Slot < ApplicationRecord
  belongs_to :terminal
  has_many :stores, dependent: :destroy
  default_scope -> { order(created_at: :asc) }
end
 