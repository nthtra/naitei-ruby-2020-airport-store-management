class Slot < ApplicationRecord
  belongs_to :terminal
  has_one :store
  has_many :stores, dependent: :destroy
  scope :order_by_created_at_asc, ->{order(created_at: :asc)}

  delegate :name, :id, to: :terminal, prefix: :terminal
  scope :order_by_created_at_asc, ->{order created_at: :asc}
end
